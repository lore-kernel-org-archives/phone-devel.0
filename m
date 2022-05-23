Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC05C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 23 May 2022 18:48:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242726AbiEWSr7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 May 2022 14:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243173AbiEWSrj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 May 2022 14:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EB8524BFF
        for <phone-devel@vger.kernel.org>; Mon, 23 May 2022 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653330621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+GHDu8bX018Pj56HhIIQXnjcT5ZvQ3bky+5co5y7CGo=;
        b=SBu+s3fgG5Ia6OEMtNoBsQhWyeS8FFJzeaTsLWKiXBOD/Dc6d+FD17hUtC0PVm6Xix2J1m
        1TsUIIOIesU/37OLwT45VCbSudyp2jYtsfV1KUuvXwgCd+BqeP/LVAkEZicjVOWnDpVgFp
        6+11o+P5xNcv9H4+nYofBD1Lgsbc668=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-W2s12iuLPEaWowrLUVj4OA-1; Mon, 23 May 2022 14:30:20 -0400
X-MC-Unique: W2s12iuLPEaWowrLUVj4OA-1
Received: by mail-qk1-f198.google.com with SMTP id g3-20020a05620a108300b006a329bc4da3so10489880qkk.3
        for <phone-devel@vger.kernel.org>; Mon, 23 May 2022 11:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+GHDu8bX018Pj56HhIIQXnjcT5ZvQ3bky+5co5y7CGo=;
        b=GlQRNcW6iiOWJHn6TuSFMaqFvc2M04sBD5X/bxm0Eg7MF0JfAU0w+AOKwPVNgUm733
         G/9pueaSQTr0YmhKJFT50h5Q6XJHqnKCTscOJvnxh19e2pdA0oYkcClXYcS8WfrlJHpd
         9SEE391KqtSzA2k1MXSzkRUt4PPmuhE6OMFPedBSMn6yoIIvG0NA1OVC6cjG0Iv6lMG2
         8JSp2dgOo6v4FZnYUHFRwnWx54gLbXOEOb0p8hEYkdxPu626WxWBWWbsrZYdSnWLtKmv
         4inVv+WoNk/Zq471RRRmHalZ+n7FbhdKWYTH69hnz7MWEUlGlDvgOhUAquQmHxAk0hNo
         FJbw==
X-Gm-Message-State: AOAM531/MG1J3GhB0AOLrZ6fptAQJw3XBVUpeW1z1li1eUFyK7GycfpH
        sFTIRik/w3CeMkP+gUOoXd6CA3M/j0KUvSO/HRT936Kl38bI1m/xLn9+Uee4rEjZmgN9ncoMn9o
        xK+Mg8zy1Bf7IbqSjhlN2QmA=
X-Received: by 2002:a05:620a:29ce:b0:6a0:e9a:f7a2 with SMTP id s14-20020a05620a29ce00b006a00e9af7a2mr14909665qkp.479.1653330620341;
        Mon, 23 May 2022 11:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiHkoWHUvw+vM4ygrqlFJMksFa2jJVr/bYTmHbbZwPGQtQuPfxdNSMdEAKmnGv/bC5IUBo3Q==
X-Received: by 2002:a05:620a:29ce:b0:6a0:e9a:f7a2 with SMTP id s14-20020a05620a29ce00b006a00e9af7a2mr14909649qkp.479.1653330620095;
        Mon, 23 May 2022 11:30:20 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id m201-20020a37a3d2000000b006a34f6a7840sm4630388qke.57.2022.05.23.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:30:19 -0700 (PDT)
Date:   Mon, 23 May 2022 14:30:18 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Subject: Re: [RFC PATCH 00/14] CAMSS support for MSM8974
Message-ID: <YovSurcGlyPW7v9s@xps13>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <638d6986-616f-4a1c-f1d0-82835b000b2a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <638d6986-616f-4a1c-f1d0-82835b000b2a@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bmasney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, May 23, 2022 at 03:39:53PM +0300, Dmitry Baryshkov wrote:
> On 22/05/2022 19:27, Luca Weiss wrote:
> > This RFC series adds support for CAMSS and CCI that are found on
> > msm8974, including the OV8865 found on the FP2.
> > 
> > The only reason it's marked RFC is that CAMSS doesn't behave properly on
> > this SoC without the last commit which is obviously not upstreamable.
> > Not sure if this should be a blocker for including most of the other
> > patches because other than that it seems to work fine and I can get a
> > picture from the camera sensor. When/if msm8974 gets IOMMU support I
> > hope this should be resolved and it works without this hack.
> > 
> > I think at least the CCI patches could get applied as they're not
> > dependent on the CAMSS hack?
> 
> I'd also vote for the camcc patches to be applied.
> 
> As for the camss, I'd suggest to get them verified to work properly with a
> hacked/non-upstreamable/etc. IOMMU driver if one exists. Otherwise we can
> easily get into a situation where we merge up code that contains bugs
> itself.

Last I checked, there's no IOMMU driver for msm8974 that works with an
upstream kernel at the moment. About 2 years ago, I took a stab at
attempting to enable IOMMU for the display and ran into some issues that
I documented at:

https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/

I'm not familiar with this part of the hardware and haven't had time
since then to look into this further.

Brian

