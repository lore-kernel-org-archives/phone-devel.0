Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9215EEB64DD
	for <phone-devel@archiver.kernel.org>; Thu, 20 Jul 2023 11:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjGTL5D (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 20 Jul 2023 07:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjGTL5B (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 20 Jul 2023 07:57:01 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B8A26B2
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 04:56:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992af8b3b1bso129551466b.1
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689854197; x=1690458997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XT+twtxTCYlY8c/fAcsypV3E8gY0Retau05eex4/coc=;
        b=XS8Ww8msMEZs/ipVPCAvtq8Bb80loTAB6c409luGUXfM0uY2yxO7tdkgsdWp3hU54n
         lQtIY5uBPsxjMB8DL81Yd9XaIUxUFm3B50keC7pUXieqY3L0EGoVLPhrNDeb54L3nOPZ
         c6HvYnaLhpByo7cYJSnzwyEpibnMSOEFT/+fu3xfycGw4qKGdWDoPQ2hOJ4aHzyaKY4W
         xuoOJ4ihqSQTMMcGpZunWRKdrPEJ0HCtI9pXMT887hBwufx0xALi5w1ooXOmaPvVoCio
         ZJinjazCqrnYQLOuaC/3R4Zm2ruf1C+D5lAWf48MuoJ3vt9CGKzW2Jax6s1kBFQouXXu
         rirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854197; x=1690458997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XT+twtxTCYlY8c/fAcsypV3E8gY0Retau05eex4/coc=;
        b=igOs+4ZqrX+sT1iY4HG0qAKWg/1EBmhaGUWvweA+r/PDCy57csf+wQLKmmsfkmhikT
         iiu4xUG4IXvRW3geLP5ppUdfOVjs2fs4Kr0lSnPv6/U4mKcy7iUNx2a8tm/uTJlk3Jkv
         PXmKeW72CisQfuLCzNITxXHP9imjkzZ00K7xrQdIAdFZFs5MYcMQbkDXVFQ2qX13LwzA
         CQJf/pvMOE/2cGy15a/o8ktKlcsh3NUovGHuFiwADBeJNbSPuLh19xXvqwcCU1PvZ7Qh
         v65skKfd1ItWK7tGpCUzyl6jM7BSdoBsek1JAO2axS+MG4hXRcTghRRIgh8axT4Nf7tz
         Sqng==
X-Gm-Message-State: ABy/qLbBsXTOFcLZqzls8W3I1NooshFwPvH+FAdU0p7aXadk4tZ6/ufJ
        W0J4CEyZSc9M2aaiPOq6kATzbg==
X-Google-Smtp-Source: APBJJlFVjStzouiZKnkcXn2pw0FoxAW2Q1fP+GOjFCDM1mx82BJGWEwxEzIbVUCBJBs1m8ITXpnTVg==
X-Received: by 2002:a17:906:1059:b0:982:1936:ad27 with SMTP id j25-20020a170906105900b009821936ad27mr5349271ejj.11.1689854196613;
        Thu, 20 Jul 2023 04:56:36 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b00989257be620sm587462ejb.200.2023.07.20.04.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 04:56:36 -0700 (PDT)
Message-ID: <4e0bd4ce-1344-4a63-e1c3-333857b3d226@baylibre.com>
Date:   Thu, 20 Jul 2023 13:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt6795-xperia-m5: Add display
 backlight support
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-3-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720091559.86406-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
> Add the relevant nodes for display backlight on Sony Xperia M5: this
> needs both the SoC PWM IP and MT6332 PMIC LED strings.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
