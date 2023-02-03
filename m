Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C35C6379F
	for <phone-devel@archiver.kernel.org>; Fri,  3 Feb 2023 15:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbjBCPOA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Feb 2023 10:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234247AbjBCPNi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Feb 2023 10:13:38 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800E9AC216
        for <phone-devel@vger.kernel.org>; Fri,  3 Feb 2023 07:11:38 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j25so1391450wrc.4
        for <phone-devel@vger.kernel.org>; Fri, 03 Feb 2023 07:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxmsZby7chocPQUWdQ4KxrGJYiRc+9itCp/CMEoa2u0=;
        b=hxOuQWtTHblrspsP6lwZmKKnUnidM9YjfN9wi6ixBK/+OF3jK5p7xPu7JkcjVWWE/j
         uRjBvkLQ5Ns4efHJMXw01qSoWrIPd06TGgreys7p6UjvjR1wkpHWf7vKZPLHe1R6sgVX
         eFgXae/5YCCLTDoKfgrgOAAbg16nGAmTcDeRnQYSifgEc66aCZahA13wym1lkbfHfR80
         ilzgIefuxXoG08ldxzK/A6Jv/3Gr3ixcbNz1+V2iAWwJeNHgBamVYENV22AY0lWYrMR/
         78YXRRSkANJYBPUT7w7l3ZEBD3zQHyYzxIRxBeQ2S1U3Rqyuq5h2uU9k2O9MIlIwd5Ap
         QrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxmsZby7chocPQUWdQ4KxrGJYiRc+9itCp/CMEoa2u0=;
        b=iy2J8cDaNkNQ48aby9O+tcTmashNTajo22JIVI1O/CtMFvQKTILhmr9jTD+KRHXgjJ
         ZAC2eKhkHHuGez6izQuqhWeBPq4aimW0kPonX1vgLgYE6KjWaektvneJYwuHyIPJUiRQ
         K1cMT1Zyr+6daljFZe34/WuC3ThYCLkNWUjoeEbvF/PAoTBmKtz252hDvvGggLP+9CdS
         qZTULPGZvKZ6QM2IVsdExGsofEv/XZIuSg1eE+SWzEkkmA6YYf2HmEtudBbN8oQoZihR
         AtfMf9Rp73bK0dxSSc5G2AYubfZkwTFq/IJb98vjSc1laBESnd7FoYUHfl7TpO/yr7D7
         gNbQ==
X-Gm-Message-State: AO0yUKUcqywPT+xu9TToTSJKtB5XU/Tq3q210bBploEbUyiaFow0tu7W
        1dE6iYQQQ8PYsCFpECo0xO6dsw==
X-Google-Smtp-Source: AK7set8UT1zY1JylxpqtIyxXTpJULytR2aCv1FOGATgmH8EGiuS5xzgYLdS9GtaHIdlfbLLTsTtX3Q==
X-Received: by 2002:adf:f789:0:b0:2c3:da89:bc50 with SMTP id q9-20020adff789000000b002c3da89bc50mr1105626wrp.52.1675437036739;
        Fri, 03 Feb 2023 07:10:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d5044000000b002bdf3809f59sm2202419wrt.38.2023.02.03.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 07:10:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, replicant@osuosl.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Henrik Grimler <henrik@grimler.se>
Subject: Re: (subset) [PATCH 5/8] phy: samsung,mipi-video-phy: deprecate syscon phandle
Date:   Fri,  3 Feb 2023 16:10:28 +0100
Message-Id: <167543702106.62628.6871055553662253962.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-6-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org> <20230127194057.186458-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 27 Jan 2023 20:40:54 +0100, Krzysztof Kozlowski wrote:
> The MIPI phy is actually part of the Power Management Unit system
> controller, thus it should be its child, instead of sibling node with
> syscon phandle.
> 
> 

Applied, thanks!

[5/8] phy: samsung,mipi-video-phy: deprecate syscon phandle
      https://git.kernel.org/krzk/linux/c/965e69f2c95e5be90ef8aa009aca4294d0433e33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
