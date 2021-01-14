Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52F4C4332B
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 18:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA2C523B54
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 18:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbhANSFz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 13:05:55 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:57119 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729793AbhANSE6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 13:04:58 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E5C951F4D3;
        Thu, 14 Jan 2021 19:04:16 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 0/3] QCOM QUP I2C - Add noise rejection, convert to YAML
Date:   Thu, 14 Jan 2021 19:04:12 +0100
Message-Id: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This patch series converts the i2c-qup bindings to YAML and then
adds support for noise rejection, which is needed for some noisy
hardware, like the touchscreen on the F(x)Tec Pro1.
After adding noise rejection, the touchscreen stopped showing
ghost touch issues and lockups.

Tested on F(x)Tec Pro1 (MSM8998).

Changes in v3, as per Bjorn's review:
 - Moved bitfield.h to maintain sort order
 - Removed useless variable initialization
 - Removed linebreak

Changes in v2:
 - Fixed ARM (32) build error (added bitfield.h inclusion)


AngeloGioacchino Del Regno (3):
  dt-bindings: i2c: qcom,i2c-qup: Convert txt to YAML schema
  i2c: qup: Introduce SCL/SDA noise rejection
  dt-bindings: i2c: qcom,i2c-qup: Document noise rejection properties

 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  |  40 -------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 101 ++++++++++++++++++
 drivers/i2c/busses/i2c-qup.c                  |  15 +++
 3 files changed, 116 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

-- 
2.29.2

