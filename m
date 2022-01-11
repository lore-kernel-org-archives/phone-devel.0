Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77726C433F5
	for <phone-devel@archiver.kernel.org>; Tue, 11 Jan 2022 02:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244413AbiAKCa6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 10 Jan 2022 21:30:58 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:45819 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244191AbiAKCa5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 10 Jan 2022 21:30:57 -0500
Received: by mail-ot1-f51.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso17113408otf.12;
        Mon, 10 Jan 2022 18:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XZ6qY2NyUzWmYuoeyElwy9FNNeOjoQhUf3oXFfCJ4iA=;
        b=c/Nh5BkX9LcdwMm9FPbqC3tOgdXlA4NHwg5lGeOTcL5mEBuWYe65y2KPUIc9q3M2ID
         lFoNjutvdAPNZhomp0c/8BfsW9DKHd7cQJCN+7LU49INC9Wwe8bkLgxbDLgjY0Fi0jEw
         1R36zfxw5JPx8778N15HiNNJlpTWxyU7AL746KRCEoBgSuGG+aVNJShCIIRTqzLMFJQ7
         qzLvz7+BruagbtJfDtc6N4h16GPsbvGG65s/HbdkvIVh9KoINEevU2AJgsYjDOd9+7/m
         dKLcVmqXpLfTTI9NmKM4FoZeZThkrly17Q9UF5juHVTmNLqJNu2z9XT+CRLwOI/t446Q
         6jqQ==
X-Gm-Message-State: AOAM531NnwI/waspKYFeAKIvivBA8XcGWbyVBOADoBmW18YHJA3zrOC2
        tyHod653AKTE5mXSqkU1ano1QY9lLg==
X-Google-Smtp-Source: ABdhPJwG7XftaQmtporrAXDbTikcT99aDcNsf0YS1tzhLNrZ7gYJ9rsWlBkC/vnzQeCYzRbMH7iyiA==
X-Received: by 2002:a05:6830:18cd:: with SMTP id v13mr1920964ote.158.1641868257241;
        Mon, 10 Jan 2022 18:30:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k9sm1798095otp.71.2022.01.10.18.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 18:30:56 -0800 (PST)
Received: (nullmailer pid 2022764 invoked by uid 1000);
        Tue, 11 Jan 2022 02:30:55 -0000
Date:   Mon, 10 Jan 2022 20:30:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panel: Extend ACX424AKP bindings to ACX424AKM
Message-ID: <Ydzr35IoHtjWwTI4@robh.at.kernel.org>
References: <20220103093501.637323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103093501.637323-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 03 Jan 2022 10:35:01 +0100, Linus Walleij wrote:
> The panel ACX424AKP seems to only be used in prototypes, whereas
> real products use the 10 pixels shorter ACX424AKM. Extend the
> ACX424AKP bindings to also cover the ACX424AKM. The ACX424AKM
> was used in a few different mobile phones from Sony Mobile.
> 
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/display/panel/sony,acx424akp.yaml        | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
