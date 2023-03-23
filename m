Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22347C6FD1D
	for <phone-devel@archiver.kernel.org>; Thu, 23 Mar 2023 06:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjCWGwL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 23 Mar 2023 02:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCWGwK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 23 Mar 2023 02:52:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1C62D15C
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 23:52:09 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so82303567edb.9
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 23:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679554328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnm4wZIIGBJUM5ou0VD6Sn8yNcOFEKHAZVQNv/SjS+k=;
        b=RmK1frKIkjVvuWGPZ1rgnEINhuP7jWE/E2Yo1zdF4Ki4xOVdBuPwNUbcABVkpRbBxD
         A947o0KEbWyUFEvJBG+sJ5zp2+fsx0rC4UrkiWBE136HG5JeLXxw8NAVUuG02E0iPEy/
         UhpyK4hsLgEgwm3K5iXWX3N0+zDjNYOQZNEg0lMvuy8OEcfBHnmHODG1kZyulo/tdOqx
         KirG3fRovG0O7iKdhDOM53lNWywb+Hay+D6MZxzwE1oeh7hpHUdH3fp7XhgIzQiETCTv
         go6i9dSMoaod35QVTzkQtMDvZadek/RhV9RTcRayxWoaZNI1LS7c/KIOHBwWmnUHV5Ko
         w9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnm4wZIIGBJUM5ou0VD6Sn8yNcOFEKHAZVQNv/SjS+k=;
        b=n4rEVn2twJK11FZ9puIYN192MnmdhxX1sl0+70E46VHyJoiahR7BWChhWpKrK7DqJx
         TtlHfyImUMWcQyJusAk2a24N+32Wq7TrNKy/Tsf/umYxiOEF/+7qfh6Bbuju+LaiptJU
         9f3gxRLJpHkWb3Xze5cRkoFodnDJYXbWc6e3WibJhctz2znADqCaTkyMb+ci1jITNZQt
         vWJmv1DHE9wisd5xBENX7XVY+UHAfOnWDNGME0Ua4McMPUGNiGN645c/J6WTiIYllbSM
         BtC7Bgq08EnK0zkQDLMZqvCejSZiISXGjIUlEwBRk7Uv09l/cPOcfwDyN1NcdlBDZogl
         18hQ==
X-Gm-Message-State: AO0yUKUGBM8RX1N6NXVryfC9eqQcgMqPGgjVAv2peZiVc4tIf+d5iTvd
        /wO+YPPLn7IsMfAJI2BorjDsxw==
X-Google-Smtp-Source: AK7set8XhOPtFHczouViFH9gLeW8HlnzbmHouwapcy11GQ87D7fFlWevDg3qhu5r61dqh6Eu4ojnpw==
X-Received: by 2002:aa7:d486:0:b0:500:40f4:f8 with SMTP id b6-20020aa7d486000000b0050040f400f8mr8933178edr.0.1679554327799;
        Wed, 22 Mar 2023 23:52:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id u3-20020a50d503000000b004fcd78d1215sm8808439edi.36.2023.03.22.23.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:52:07 -0700 (PDT)
Message-ID: <ea980e5c-3dc8-0fd6-8635-8f58a0745ac5@linaro.org>
Date:   Thu, 23 Mar 2023 07:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: Split elish dts into common dtsi
 and elish-boe dts
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230323005925.23179-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323005925.23179-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/03/2023 01:59, Jianhua Lu wrote:
> There are two panel variants of xiaomi-elish, BOE and CSOT panels.
> In order to support both panels, so split elish dts into common dtsi
> and elish-boe dts.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Remove sm8250-xiaomi-elish.dtb to avoid build failure.
> 
> Changes in v3:
>   - squash patch[3/4]

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

