Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D32C433EF
	for <phone-devel@archiver.kernel.org>; Fri, 25 Feb 2022 19:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbiBYTha (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Feb 2022 14:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbiBYTh1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Feb 2022 14:37:27 -0500
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9462A210D4D;
        Fri, 25 Feb 2022 11:36:52 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso217331ooi.3;
        Fri, 25 Feb 2022 11:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dxCZfx6WpVdjl09FENIy5MTlgViGPCU6N+fa6pk3q30=;
        b=WivE2DMPENSBllJMl4/gDw6Dgb+A5x9g6lsXNwrIETO7LII0sSvWCHgDBkybKK9/VC
         akxYpbmkBwj8AWfb7biap2tIsVe5Hgn9lmYB0etCnmbnDNhCeuGrqFblXsci9UjeGha5
         Z/aJiO52LrAQmx7Frw/lJU1q23b9VSc5pHrA+PLOwBdsjtR+bvxTQmAhsIaUGgljbU9m
         9Sm6emuRXxrX649pnp6rX40dFSOyC3oVdekTRB/kCbB4AL4LphxHWSVugfg0PPWrHFUa
         w9GqRqWIxa14oik7cTfS+neqtB0KI1cph7AMUH5bawC6uYAxXstJ/j14Sw/mkMhye/jD
         sXWw==
X-Gm-Message-State: AOAM533tVEhdxPUVyGF4BQm4Uj/Jr9/HRBdDW0IntNCpzMYfxxQ9fByS
        kGM0j5znG7UygA4PWG3ZldDX9KNoxw==
X-Google-Smtp-Source: ABdhPJy6J8r7JTacw2dSg7WfZ2Afzh1sHhSdJHaQFxnCpuZXTzN7EmXftoRIuSwDjrOw/eGfC6DD9g==
X-Received: by 2002:a05:6870:1612:b0:d6:fc52:619 with SMTP id b18-20020a056870161200b000d6fc520619mr576664oae.95.1645817811877;
        Fri, 25 Feb 2022 11:36:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o30-20020a9d2221000000b005afba29d1ebsm1476780ota.69.2022.02.25.11.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 11:36:51 -0800 (PST)
Received: (nullmailer pid 1303787 invoked by uid 1000);
        Fri, 25 Feb 2022 19:36:50 -0000
Date:   Fri, 25 Feb 2022 13:36:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: ux500: Document Codina-TMO
Message-ID: <Yhkv0hF88A+vwYPI@robh.at.kernel.org>
References: <20220222233313.1774416-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222233313.1774416-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 23 Feb 2022 00:33:12 +0100, Linus Walleij wrote:
> This is a U8500-based phone named Samsung Galaxy Exhibit or
> Samsung SGH-T599, codenamed "Codina TMO" as it was made
> for T-Mobile.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/ux500.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
