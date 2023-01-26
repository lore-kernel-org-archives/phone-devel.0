Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926B1C54E94
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 10:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbjAZKTC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbjAZKSb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 05:18:31 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63586577E8
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 02:18:00 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id m7so1232235wru.8
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+p2wGZjjhA8Z5oEebmL0UJ5yGp1eLDKs4zAEYYJl8s=;
        b=foVkUMpxmBnudnLqXkpTMoobC2vVFDj6kdOnO4UWhv/vnFL4vs+GZEAgfL/CBVO6VI
         47ilwy06VTcyNTfCYLvZCf1vnhbg5s/y27OwNWYzBPx+SdSAbbqIk8h9Ss+07mcwxxX/
         gbHNqZ1MKgqaD5GH/JZqweaRG8KH32ZkNu7DygYecOzGSWqjWrwssbakbASi03oSsaO1
         g5qO4pGqB10GVrLK6uCqZSC00H9fy65TO1YmUpbCn+d2qxxNgG0NsBJjSmkCqMEokZP9
         TKMIVQnMJcudCiEnXBcVSmh82/we34qkiBsCKF9DwRjVJcNcpfG/35wXl6Mlns92PNzj
         9/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+p2wGZjjhA8Z5oEebmL0UJ5yGp1eLDKs4zAEYYJl8s=;
        b=HT8yD8UjQ9obDDFZone72k5WiE5sSUYR4aIbHNet2F9UJBFJisCzZYGnkkq1Nd63LQ
         LnHxd0JLjHgyWC2sXiAqQTqfvCTZvuz7kCvmNbokZvhawVN9Flgxg5IwMmRrPHRpRGIB
         TYsKw/3YL3JAlAeiuji+xQjpkEQxXsphOHVS5G/Y1X232PA5l0+D4dhlphQVtMmWpgtM
         qUhAQZUdG3obta+65FLU3xx7XGFdMCE2NUdT11RyO4quaJ0xS5kXUH+LLoc8tDnNnHhY
         h92ZKFNyX9sh9hQYsV6jkTuspguIUlso30EFA2fQHMUpZaP2I1ckxFMNgahp8q+Fgzce
         8+1w==
X-Gm-Message-State: AO0yUKWyae+4VTV8JTVw+21+dEyPmDQrtGuGT/TPfearhjMqPu5kWPd6
        TC7GcSAIbrOpCeGpduD8BypJpA==
X-Google-Smtp-Source: AK7set8KhgUPl9JoiASNhQZw6LZV0FTtcmv99S+Bkhp/aB74AbcInfRUPWHEFWrap15wJe24ZVa6Tw==
X-Received: by 2002:a05:6000:18a9:b0:2bf:b54f:61f0 with SMTP id b9-20020a05600018a900b002bfb54f61f0mr10118347wri.57.1674728274099;
        Thu, 26 Jan 2023 02:17:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002bddac15b3dsm868315wrr.33.2023.01.26.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:17:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, replicant@osuosl.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 9/9] arm64: dts: exynos: use lowercase hex addresses
Date:   Thu, 26 Jan 2023 11:17:46 +0100
Message-Id: <167472826060.11433.16383674280550477949.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-9-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org> <20230125094513.155063-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 25 Jan 2023 10:45:13 +0100, Krzysztof Kozlowski wrote:
> By convention the hex addresses should be lowercase.
> 
> 

Applied, thanks!

[9/9] arm64: dts: exynos: use lowercase hex addresses
      https://git.kernel.org/krzk/linux/c/5cff13f07eec38ecb70e6839060d0a795b690a53

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
