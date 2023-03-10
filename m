Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25763C6FD19
	for <phone-devel@archiver.kernel.org>; Fri, 10 Mar 2023 09:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjCJJgr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 10 Mar 2023 04:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjCJJgV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 10 Mar 2023 04:36:21 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E328822123;
        Fri, 10 Mar 2023 01:33:43 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so9210302pjb.1;
        Fri, 10 Mar 2023 01:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678440816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sAFEXOe7wgsyLbBLPoY5abX+Iy4JMH27UPzyBAnZiOs=;
        b=algmRXAmw/PTACbZXDj+h5hzSPXyXWmQ5V72lVynjL3emQQs6L1JcbtUpqKC/oD0qV
         +Z2fugA9+G/J2FOxB+faEcy+HDAdOC1b8vNiA9JyuPz1NJM02byxh7+TKGV3r/SRvFBx
         cmSPF1w3TZdiCJqglUnVbyMpBjHFI1ycxacbs4bkLIFUXBNiFZHAmTWGqkzxIm/ubdby
         vskqkfbquFIGeFuW+jDwgnBlPkWWN67lENx592waOxVmAtZWuJVmdNNgbAif8suLATOc
         MSEpQhJvXArDhj5l0TAHfUQppuh7X4IY6IO/HizZQushmhNNrmcv+6aba2RmvlHhcnm3
         7G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678440816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAFEXOe7wgsyLbBLPoY5abX+Iy4JMH27UPzyBAnZiOs=;
        b=PRBr7xfboUpMuDYO4FlBrl8tqNad2jcH48Iu+oVvpWHllnT+l6SOPSQTw0neoCUfc5
         ULKPA6lti+1zAzspT8tY/X7xgNc1sTY3nJ++/WJnV6ryglXByoLbHjDkrZqkk/DLkydC
         75aGG6Vg+10okpN7W2oinCPt01m7VcRjD2WYPEJu1CEO87c7FIUEw0OVA3vj+4v0b65E
         3YA8YWjD1P8yOXsBMj6Pvrc2v4bVcbDLwE4p4DRMVgvZCUAStL/dS+FqcipozSRNl8Xc
         VERRPq6aVwuQp6ATHeb42jWNqZuRjdRrYLmxg0V32Ru6bVXbuwOIZrdhaMGOzlS2IY38
         AeTg==
X-Gm-Message-State: AO0yUKURSnjuDaaiNMYJxT4HBgsq94+rqqkoLrDsWhExqaF9eVVfESCL
        kQaKprC5mu6gtwtVpos270qB7hQBCck=
X-Google-Smtp-Source: AK7set+wVmUJflBiERXkVgtH8PJDpvz6KI8ttDs/c84M6LdycwYb06z/rwzgOHJOF+hekfz0ogXRdg==
X-Received: by 2002:a05:6a20:bc97:b0:cc:ce95:7dcb with SMTP id fx23-20020a056a20bc9700b000ccce957dcbmr20997681pzb.13.1678440816140;
        Fri, 10 Mar 2023 01:33:36 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id i3-20020a63e443000000b00478ca052819sm916856pgk.47.2023.03.10.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:33:35 -0800 (PST)
Date:   Fri, 10 Mar 2023 17:33:28 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAr5aO0BpSeW5iXD@Gentoo>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
 <ZAh3MSpQ30YyPAVe@Gentoo>
 <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org>
 <ZAiPTat/kmLyaJmA@Gentoo>
 <aac6ba9c-4230-aff7-c93d-23eaf6895464@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aac6ba9c-4230-aff7-c93d-23eaf6895464@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Mar 09, 2023 at 11:37:17PM +0100, Konrad Dybcio wrote:
> 
> [...]
> = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> >>>>> +		if (!dsi1) {
> >>>>> +			dev_err(dev, "cannot get secondary DSI node.\n");
> >>>>> +			return -ENODEV;
> >>>>> +		}
> >>>>> +
> >>>>> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> >>>>> +		of_node_put(dsi1);
> >>>> Shouldn't you put the reference only if it's found?
> >>> thanks for spot it.
> Apparently not.. please don't change this
OK
> 
> Konrad
> >>>>
> >>>>> +		if (!dsi1_host) {
> >>>>> +			dev_err(dev, "cannot get secondary DSI host\n");
> >>>>> +			return -EPROBE_DEFER;
> >>>> dev_err_probe, here and in neighbouring exit return paths?
> >>> Acked.
> >>>>
> >>>>
> >>>> Konrad
