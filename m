Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B2C636CD
	for <phone-devel@archiver.kernel.org>; Sun, 29 Jan 2023 10:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjA2Kks (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjA2Kkr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Jan 2023 05:40:47 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CD321976
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:40:45 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m7so8629053wru.8
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKh+XybqNbJwTS+RVODYj3gQs42RNsq1kxtqGoR4Kjk=;
        b=TDnhKPPsYH68DdPdxnsqSr8n2hNmvFXcfEVfz3DRssMOaF1ISTuReRrEw0vxsvr2JS
         QXA48RrhxZuBSBI1o3SchuI6LsmRZVnke1HqdIn0Z7En2J+FBoPKeF4JcZquIZGUzLEC
         lIlMIBv+hVLzyDeEJdUGeuzzxma3mPSJuzWm+PJw9Db2V7nYarrCQeIzyGVIqt/PzVrv
         cenwFGpTCk9C9+uuZq/emINhDuabB9r4zNvOzSYQUzLxMbNAInKLVhaKVSlDirmYE1KQ
         ENtjpbASmu2zAK//iJ9i2Xjgfv5JtiFMAilSyWVqySPuTz1O+/U92/s3ceH4yKziOaOg
         muiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKh+XybqNbJwTS+RVODYj3gQs42RNsq1kxtqGoR4Kjk=;
        b=DjjBavgeaJ4sECNeBtYDdn3Zez5eQji5afBuucySkyqyB0m8o5xzQwN5kqA8LwAzc4
         eSbzLxdg+ZEU+DJdwZGsmgh07oB56et9WaGLBfrQZeGA++UYZ1rdgYKAFimNbuAFAKTA
         65BbOGQwTd8niy/DGR5ge+cRIidpToziWiJexp9weP/9sdmpiX4m7ssoyzlyYjFNhDr1
         5uzqHUOWBp+kbiC1oGOpdyl/ObvHuISYFXu6gAwibxg3jFXj+MT/8CkeU5NkBlR6+ktU
         AQH6G+Z8wa8oW8pzqlMvkc9VUbBglWjlgn7GVMo+fT9Vl68akuArbP6iWANawyvOV1ER
         hZ4A==
X-Gm-Message-State: AO0yUKXaWQiu8+PqO1YgZ9ZCAJ+PrQt6Yu/Ykgi8FkFX63moq+k25WSA
        leiM6jq57aw73fqtY+ZLzQtLHtw/FmbUeU6x
X-Google-Smtp-Source: AK7set8aaEjSgjREY25nSXIG/U6o5JXvwCrhED8l4ohr7GN6TUNZeYgiRV5y6JEEVt4naNnwzQSrZg==
X-Received: by 2002:adf:eb04:0:b0:2bf:bc75:1730 with SMTP id s4-20020adfeb04000000b002bfbc751730mr12200577wrn.70.1674988844225;
        Sun, 29 Jan 2023 02:40:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm8803443wrh.91.2023.01.29.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 02:40:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     replicant@osuosl.org, ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
Subject: Re: (subset) [PATCH 1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as child
Date:   Sun, 29 Jan 2023 11:40:39 +0100
Message-Id: <167498882911.7239.17446486264996020803.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org> <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 27 Jan 2023 20:40:50 +0100, Krzysztof Kozlowski wrote:
> The MIPI and DisplayPort phys are actually part of the Power Management
> Unit system controller, thus allow them as its children, instead of
> specifying as separate device nodes with syscon phandle.
> 
> 

Applied, thanks!

[1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as child
      https://git.kernel.org/krzk/linux/c/fe6a952b567f6a771d087d2e969914f31574d6ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
