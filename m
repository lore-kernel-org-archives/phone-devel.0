Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448FEECAAD3
	for <phone-devel@archiver.kernel.org>; Thu, 15 Sep 2022 11:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiIOLgF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Sep 2022 07:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIOLf5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Sep 2022 07:35:57 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C762796768
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 04:35:56 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id v16so41405352ejr.10
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=tc0xiA0Fwrt0tr5qIWgvRfBTzVbLIFg6idBAE+8WU/I=;
        b=UdhlByvOOIEZcWyzkI63iyDfrAbG8EujZhjIJPchJIWGMsQrgfKyhK5hScvEyRzbK3
         wHTdCAk/hIE8PVXNCt5Zj7x0mFREs/Jew5pmtu5FMmUAwiKFGs84rSnrFnpP2vX8W4B+
         SvHK/ngnjdw7tSvM7uWihgtO6i1ywnuq/P0j2VC2ViRgDstV2+QNc6wwRr+IbO1YkO3l
         nzzx+2sM2td+Q7DibKY+uVPnwe02wadaog2imNTk8I0JRCqVEibu7TnwRxoaqxdTnqyg
         0fQddevMbNgoYoAZtuqBMo1FHXEhJ6XbtHIG20T5+mkJJe2st+3F3xzCy+wpOaPJ5+Il
         ELMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=tc0xiA0Fwrt0tr5qIWgvRfBTzVbLIFg6idBAE+8WU/I=;
        b=afaBaxbDesnkMJ2jBLAu+v47YhfLEJKJ+YEezOAPNWwigKCmubEBhNbUsV/ZmDOpQF
         Dit3tGVKXyqkUHASIHOpVnaoMw2OBMMiWgfG5GPMVXm+9P++bRWkA0xxjAVN3d6aAizf
         5vre5v9+IQ98WJmVK2yUNfUcB5wuKFY0RgdRTaN//lxqWpzON01om6WQjeKJhYIkJ17K
         VU1rgO/bbpwuHUVlhwj1Cy4auAm2y6UCfWvRyBB+t/1SXxOY5GqI+zqqbcltwC25egu0
         maVDHtsx8TX9px/DS3YQmUJssx1nCf7fgdPTIDCxSH/vFIMOoeCYw+flc4B/7SE5Vr1U
         Rc9w==
X-Gm-Message-State: ACgBeo1ETzhYiQbNQYpZWgc0q00mRB6ZVkTIi0Z4BymuD4iqaCNuIgY7
        XqHT4kd4I6Oqy66tra/CRO8BXw==
X-Google-Smtp-Source: AA6agR523eREVuiFhSt4qHKnQ25GTFAQ2xdd14LRUxO2aGmYQVlEroNaRDIw81THUGy4j4inSaePaA==
X-Received: by 2002:a17:907:a413:b0:780:1ca3:5424 with SMTP id sg19-20020a170907a41300b007801ca35424mr7338817ejc.671.1663241755411;
        Thu, 15 Sep 2022 04:35:55 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id fi24-20020a1709073ad800b0072af4af2f46sm8910424ejc.74.2022.09.15.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:35:54 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Date:   Thu, 15 Sep 2022 13:35:20 +0200
Message-Id: <20220915113523.44074-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

There are some IDs that are written in uppercase. For consistency
convert them to lowercase.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes since v2:
* Split out to separate patch

 include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index 72398ff44719..fde0148d0077 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -29,9 +29,9 @@
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
-#define PM660L_SUBTYPE		0x1A
-#define PM660_SUBTYPE		0x1B
-#define PM8150_SUBTYPE		0x1E
+#define PM660L_SUBTYPE		0x1a
+#define PM660_SUBTYPE		0x1b
+#define PM8150_SUBTYPE		0x1e
 #define PM8150L_SUBTYPE		0x1f
 #define PM8150B_SUBTYPE		0x20
 #define PMK8002_SUBTYPE		0x21
-- 
2.37.3

