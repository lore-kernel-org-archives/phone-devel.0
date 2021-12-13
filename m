Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD024C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhLMIOM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbhLMIOM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:14:12 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BC5C06173F
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:14:11 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w1so49075727edc.6
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urCpuNt1wHICAQXm7jvJSx+Hvgnhjh0/XcNoIPBGnGU=;
        b=PaVhthNvM5fWcdIyQw7JU8d0M39KK6YEcTG6Q/D8o7hVwNC1sEPGqqRWPWjAaUUZBr
         EpLuFLHC2bIhj8urw01BmgXJUjExeG8hlfAdGzlJYq9cCx13sT/cLRG0mXb+WosdV3Qx
         ziqCmz99z8OaemI7i3ahtjaArJ4rlVcC2naz8GBjMHl7Xs1eV9K4YXIMqu4oHfvYNeGE
         zAkPzo2vi2lod7p1u9id1fFFIlxIn0jmn6fbl+0YTTCpr41ztft1hSTFO9z7eULnOfBd
         OW2+A06IJ6XfVZD7kKprnYKQoKESqB4mw+6ITiGy2YcuWyKMYiZ9uDy0jiTtqRhbqsPH
         PVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urCpuNt1wHICAQXm7jvJSx+Hvgnhjh0/XcNoIPBGnGU=;
        b=HP3WKMIOGDseHF744EhvW8QSzueSl5Brg9jg07It1ngYzYe0isnXGa+VNn7pHHkofS
         H/wXfKRfUvl3+ZDsWa+m75ggLAKU2pRuJfBUXlFfqXAQZyCayjf4QUt4lpc5o46uqqTj
         HkZ/0240FUEIScvVhGSllhv7Qd2sUS/s+mQ3E+pjzPN8qBoYFpq6U/H5dy1q12b0f82w
         F5snsLgIRRiXbuo+rRYNP8O+jy7uuoOm5nV7oup4dUzJvf8uEEqYgQBhUz8gXxBNzTwD
         Yd35N0XN8wTkJlwZ8koWyldCsD721admwOlAf02X6T6HwVgwfYP7q68LJtnMRHOLp/vz
         8VzQ==
X-Gm-Message-State: AOAM531eqrw9aKcaQRsCuFbBGc98+aQW9refmI1ql2UVRffzuhgH/7at
        aBeyQ5lEgu+ZcBT9hqRE28jtjlHnWx6SBh6I6CM=
X-Google-Smtp-Source: ABdhPJwHAuwwwoBFWQOXBp1uljf/NgqhxN4VI9ZiwKgQ2zGuczvc5w404S64mjX9EQ/Q2Nji2irdfQ==
X-Received: by 2002:a05:6402:174c:: with SMTP id v12mr63204152edx.168.1639383249926;
        Mon, 13 Dec 2021 00:14:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id x14sm5369696ejs.124.2021.12.13.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:14:09 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add SM6350 and SM7225
Date:   Mon, 13 Dec 2021 09:11:11 +0100
Message-Id: <20211213081111.20217-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Both SoCs are known as 'lagoon' downstream. Add their ids to the socinfo
driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9a0eb59405e8..f41aa142c207 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -313,8 +313,10 @@ static const struct soc_id soc_id[] = {
 	{ 421, "IPQ6000" },
 	{ 422, "IPQ6010" },
 	{ 425, "SC7180" },
+	{ 434, "SM6350" },
 	{ 453, "IPQ6005" },
 	{ 455, "QRB5165" },
+	{ 459, "SM7225" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.34.1

