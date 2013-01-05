//
//  PrincipalViewController.m
//  ScrollView
//
//  Created by Rafael Brigagão Paulino on 28/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Scroll aconteceu!!");
    
    int numeroPagina = _meuScroll.contentOffset.x / 320;
    _meuControl.currentPage = numeroPagina;
    
}

-(IBAction)pageControlMudou:(id)sender
{
    //mandar uma mensagem para o scroll atualizar a sua visualizacao
    int paginaAtual = 320 * _meuControl.currentPage;
    [_meuScroll scrollRectToVisible:CGRectMake(paginaAtual, 0, 320, 460) animated:YES];
}

//metodo chamado quando a view e carregada
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //montar o conteudo
    
    //qual tamanho
    _meuScroll.contentSize = CGSizeMake(320 * 6, 460);
    
    //gerar conteudo e associar ao scrollView
    for (int i = 0; i<6; i++) {
        
        //gerar o nome da imagem
        NSString *nomeImagem = [NSString stringWithFormat:@"wallpaper%d.jpg", i];
        
        //gerar uma UIImage utilizando o nome criado
        UIImage *imagem = [UIImage imageNamed:nomeImagem];
        //alocando um imageView e passando uma imagem para o contrutor
        UIImageView *imagemView = [[UIImageView alloc] initWithImage:imagem];
        
        //como o scrollview pode ser visto como uma grande fita, vamos posicionando as imagens lado a lado, aumentando a posicao Xdo frame em cada iteracao deste laco
        imagemView.frame = CGRectMake(320 * i, 0, 320, 460);
        //ajustando como a imagem vai ser tratada pelo imageView
        imagemView.contentMode = UIViewContentModeScaleToFill;
        
        //associar essa imagem ao ScrollView
        [_meuScroll addSubview:imagemView];
        
    }
    //altera o nomero de paginas no elemento de paginacao
    _meuControl.numberOfPages = 6;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.   
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
