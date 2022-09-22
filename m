Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C0C6FA8B
	for <phone-devel@archiver.kernel.org>; Thu, 22 Sep 2022 08:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiIVIbQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 22 Sep 2022 04:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiIVIa6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 22 Sep 2022 04:30:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F88E956A5
        for <phone-devel@vger.kernel.org>; Thu, 22 Sep 2022 01:30:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y5so14332734wrh.3
        for <phone-devel@vger.kernel.org>; Thu, 22 Sep 2022 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=yMyeJjCdNNiGUuThqHk0PauP+dgra8U1iiTiP5AqZ5s=;
        b=3Drg2x6qOY2JRZezvdAW9KcV8FcwbDOaUIrBMpW9GG7FsWPDjLfbvkFF1yDS1r5Wsx
         Xu92RIDguJF6Gs/BKA2fclza5UCghMSfS0otTIa2HC92/P6OIItDMj3I9cKy6wqHXKPB
         GJdVa7Nxo8nsLwFaff9QWpdPDg4cn6Ibg0A5VVzdCcgKD4wkFhuf09vNvyLKIRM2OqjD
         CVLpwHSZxXXjxMCwbwIRzTb7HsRYlj+yUt/5ktbTQ/Of8zOcnrV+OXdKcm1AZFgGqhuo
         Yl2UUPvgdxVv+lQGQCAxjtKsE/Q2orLjzSgeKQP78loMzUORZbfycZ7tGRxOwJStP6Uc
         l0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=yMyeJjCdNNiGUuThqHk0PauP+dgra8U1iiTiP5AqZ5s=;
        b=TWBS+6fwy20ATt4bNW0b24siHHRF4z/44LpVf4Qdf7lxH5iXupUMirJfw6o4T9qS3K
         o4B4JZFfQal+suIt5i4C6Uzs1BntxfZll9JxXgiWQCZGi0cdA+qjViG6a8xLwB3n2EkI
         VX0T2VcS3qkQ1oFrMQ3WU2AAmgacrh20vprAsQwPcR4gqmlT3fcJ475ShbjDV3nYSFV0
         jPZK1vL2whOUtmpsk7uy31oSovb/RlFCgWhoiupmt6tnQaV0EQEsC1BwR+4fi0n94UR4
         d1CJqWG+4WOnIS0r8KGzKPBnC8NYBsa/EM60N4ZQ8BlzVgzb0RY5ugumTJx8WGhX8kVQ
         aoVg==
X-Gm-Message-State: ACrzQf2d0qeH2dpxs9oHESd0uWAMAjmqwvFL6gTmssi2cXhjq69GNddM
        s2EP4Yhva8HbH8YjXa7e0LRjKA==
X-Google-Smtp-Source: AMsMyM4AN39EDQ8ZS/jGzwQpomifGBPbh2W14gq6R14hh7MkoDjso8KCm3hHFeC7Y9mYAlo0edsnYQ==
X-Received: by 2002:a5d:5887:0:b0:22b:107e:7e39 with SMTP id n7-20020a5d5887000000b0022b107e7e39mr1250324wrf.694.1663835441133;
        Thu, 22 Sep 2022 01:30:41 -0700 (PDT)
Received: from otso.. (212095005231.public.telering.at. [212.95.5.231])
        by smtp.gmail.com with ESMTPSA id q17-20020a5d61d1000000b00228b3ff1f5dsm5088476wrv.117.2022.09.22.01.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:30:40 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] soc: qcom: spmi-pmic: convert hex numbers to lowercase
Date:   Thu, 22 Sep 2022 10:29:22 +0200
Message-Id: <20220922082925.17975-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

There are some IDs that are written in uppercase. For consistency
convert them to lowercase.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
Changes since v3:
* reword subject
* pick up tags

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

