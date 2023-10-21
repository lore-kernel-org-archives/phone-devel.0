Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1444C004C0
	for <phone-devel@archiver.kernel.org>; Sat, 21 Oct 2023 17:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjJUReu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 21 Oct 2023 13:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjJURet (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 21 Oct 2023 13:34:49 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658DE121
        for <phone-devel@vger.kernel.org>; Sat, 21 Oct 2023 10:34:44 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so1346435f8f.2
        for <phone-devel@vger.kernel.org>; Sat, 21 Oct 2023 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697909683; x=1698514483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAD8koNag2d2JiuZzDEdme1uco389oMcfmj0tVw3ir0=;
        b=YalzfpQGXQ6NOgnlTaIEwX1Dc12UFy6oBKITgvJ5jET9H9W+K+PlYjIhhFI3BOT3JT
         C7jBJV6SyQOR/5+Fq98faQXj7og1xxv8jEqjCJNoQy0Nlq+7Ilwc5KYs1e3eHyvUMY+H
         KpTiqcqPlZHHgAK2UInrlKlRWQku3YrFHvVENDTOO4klmJ9+GoD5WnNjQ2pXpQ4N4rsR
         1HPjEHUXZWxEjGg/WvVyMy4M6Ej5kjuHJIIIKmvkjXbRme9Mv+I4tLwrjEHjbgMZM73L
         kLW6xZFNSBdi/xoZ6s4+os6E2VM+k9DSFDt7BFVNmFlvK/ZRDLO2VyXLjhtJW+pin/dA
         REpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697909683; x=1698514483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAD8koNag2d2JiuZzDEdme1uco389oMcfmj0tVw3ir0=;
        b=bACgtopB8+Myt/5O/YDjTL0I8M1lkbcfBcrvSYP8R8gooVoKDALWeToLCtJEnLbdDJ
         DscPeISHILNzCqkzSF9JKlJtqZH84mx3a8T6LJ6u4AaHyJM0jPMu4qLUL5LFxc9pWKxv
         s4hhr0N2PIJbOOUDUNTob6G4rWTWQ15ilNTVs3yOOSaX0wS7YbDXThIt1vNBksybj2Tu
         lILriQmaK6hg+KrX2bD3CVPTntMtOOsPZwGRSxjGjIvQ3CNZBI702Xh797n0C11/+Mrt
         ulDF+0Z6CiYOLJ8pBpP705U6krTXeOodfML/PXEH1dLqcK+n9kIDhEPO+KkKdAZoddSX
         1oTg==
X-Gm-Message-State: AOJu0YxN3kx6T6gE0YLXaD44chU5ypEgVqyYefd7BYjXzsCTLTofdC4w
        vciDUFMUgNvoR4M8WzMFw6CsWQ==
X-Google-Smtp-Source: AGHT+IEdWOZfR7p1w9Gb6XxLwAdNTGUgNWToaW2hfYQYWWvy8WPkZ2M5RTmKk2TbFj+qKJVFImmR2w==
X-Received: by 2002:a5d:5691:0:b0:314:dc0:2fca with SMTP id f17-20020a5d5691000000b003140dc02fcamr3367064wrv.29.1697909682769;
        Sat, 21 Oct 2023 10:34:42 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id h12-20020adff18c000000b0032d402f816csm4019129wro.98.2023.10.21.10.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:34:42 -0700 (PDT)
Message-ID: <5e148fb1-c04c-4dd1-bcbf-27c7475d4f01@linaro.org>
Date:   Sat, 21 Oct 2023 19:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20231021143025.77088-1-lukas.walter@aceart.de>
 <20231021143025.77088-2-lukas.walter@aceart.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231021143025.77088-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/21/23 16:30, Lukas Walter wrote:
> This dts adds support for Huawei Honor 5X / GR5 (2016) smartphone
> released in 2015.
> 
> Add device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI (internal and external storage)
> - WCNSS (BT/WIFI)
> - Sensors (accelerometer and proximity)
> - Vibrator
> - Touchscreen
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
