Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441FFC4743C
	for <phone-devel@archiver.kernel.org>; Wed, 23 Jun 2021 03:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27F9F611C1
	for <phone-devel@archiver.kernel.org>; Wed, 23 Jun 2021 03:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFWDkT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhFWDkS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Jun 2021 23:40:18 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F05C06175F
        for <phone-devel@vger.kernel.org>; Tue, 22 Jun 2021 20:38:00 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so604559oti.2
        for <phone-devel@vger.kernel.org>; Tue, 22 Jun 2021 20:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NDeQnIVv2I2xWC2rTkdE3rAvheRucQaheIz+92aDMhg=;
        b=wqH5fv+pnNN/ZQfOLvll5P2lZRBk06ExdzIMsXlWDFQdcF/KddF0+raFxrNd7XfZ/A
         LR9DCeioQ8ZbZJmiH1ijipre5ZkLuK/ZOUkwuNGVkkjjNIa41jbrtx7bLznx0ZiAwfHI
         N1Mxzl7H2D0x+ImfaqE8qGA65/P1vcItVQrQyOQUWNTe3SYiPlThvlVpdoOgz3kdoWbg
         MwkoNMdLsQN2oWbTB8XEPDeA+jqQAO9eL/n5r/K7WMACXiODRYK0TRYV+VYMtA9ySLV8
         m+o/0wPP/CPd3/iOw3xjGgcoEGjcOHkm2mw9feKJAry3UkXDBk1N9AZbt8krRfezaTOX
         aqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NDeQnIVv2I2xWC2rTkdE3rAvheRucQaheIz+92aDMhg=;
        b=BJa91N4ovbgWiHsKuolJouRClRrp1thccXrBFgXDRZSVeG/i3QMsvx1gi21i9h7Xmb
         TphhO5gh8UYLyodBHbeW7+UtYSHjIyRwmUvnerq2zdhcDEDacFnLGLEW8xHeexo1kxOF
         HntBV3j2CFvnQ01d1az/S1iw5/1sSqzfL2OkqsANZy75t87OjGcLQANTeLLlpbqjA+k+
         21Nsyn0SuhCejtT1Is6sxWkd/+53YHX9Fg7pOyut1UPoqGnVuVw0EKNP5iudbEdqICEi
         xveMIzliXEWoxJ1PD/SAMyVLL5Bqb7NRTIY9RFbmHosJ4IvlOnxoIkS2bW9k3hRrHn6c
         sx+w==
X-Gm-Message-State: AOAM5305HLAr8KP9S5H0eijZfxAmBEdFZf7tkNBxeFv7PyaA2R3DFcMp
        uPKZwonoDBx1uzs0MqFQmW2M/A==
X-Google-Smtp-Source: ABdhPJzvBiULY4+NEyotaX+PAjSwSpdfraIWd59ttxXH0ID7xSAg/qWrc7Q1FPhDn+rmNIS2DMQtpA==
X-Received: by 2002:a9d:3e15:: with SMTP id a21mr5971483otd.366.1624419480109;
        Tue, 22 Jun 2021 20:38:00 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r14sm4641240oie.43.2021.06.22.20.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 20:37:59 -0700 (PDT)
Date:   Tue, 22 Jun 2021 22:37:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 2/3] dt-bindings: phy: qcom,qusb2: document
 sm4250/6115 compatible
Message-ID: <YNKslaqcVwSxR4/v@yoga>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
 <20210622203240.559979-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622203240.559979-3-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue 22 Jun 15:32 CDT 2021, Iskren Chernev wrote:

> This compatible string is for the HS USB PHY on sm4250 and sm6115
> platforms.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 9f9cf07b7d45..70258540676a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -23,6 +23,8 @@ properties:
>                - qcom,msm8998-qusb2-phy
>                - qcom,sdm660-qusb2-phy
>                - qcom,ipq6018-qusb2-phy
> +              - qcom,sm4250-qusb2-phy
> +              - qcom,sm6115-qusb2-phy
>        - items:
>            - enum:
>                - qcom,sc7180-qusb2-phy
> -- 
> 2.31.1
> 
