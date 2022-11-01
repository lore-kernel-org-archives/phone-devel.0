Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1C0C433FE
	for <phone-devel@archiver.kernel.org>; Tue,  1 Nov 2022 19:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiKATRX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 1 Nov 2022 15:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiKATRW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 1 Nov 2022 15:17:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9161D0EA;
        Tue,  1 Nov 2022 12:17:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p8so24715077lfu.11;
        Tue, 01 Nov 2022 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/YWtW5CJ7oLwHYtwtrbiJqFWm3K+cunYU28q7Z1qsw=;
        b=B95SOpO8qqNWg4A20PtgMXXW1lWIjshjeBNBYIm4BC0755CyqmhZ413Qijg3nfY7GR
         d3GOP5AXLOIDS+r3++muDgkxZbrj2CE7UWXu0kdA98bBMyA7DXPTELVTsT5zDOxuoO/w
         xW0/c71Z+VG1MJSWDF5rg5RvjOjHMVnS78G88WsPdZ/DoI8r9/C8px7iN/Pb1WVN3xsN
         XCUgJSJFzY1Pl6lIj0v+rp26Kr5C7dXYnPy+SrlG8YhE4EiNLGaEkXTR7Ju4Q+Xv1LtG
         MMvhoMuOI2qiKt0VW++pBKgckEoqK83XXBwXdzKdOgEnvFymlBQVKriQF2jtA1AKG0tt
         giHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/YWtW5CJ7oLwHYtwtrbiJqFWm3K+cunYU28q7Z1qsw=;
        b=7rhJNlplqSf+WtuHzfG3seQH5Vna5zOuYbLD1g2e/iHZil4jaUSVxCpxtJ4jQ7A4oQ
         4GxL9e4kqhHJnWnJjxPbkX9DkMoQRzAxvnfdGx6do+tWfnwQMXpnsq77TTyfWVX5k/qd
         jGLtqsp1Vr0XsCip/ostZQbIpgLv2Vy6cJSV24vvBdtlXGOw7NMZ3WmujZJqWo9VraC6
         ODPSIrln/0CLVc7VeZtHYvySlogOSJaKlHZLsdD6kMRo04ITbqWp0P2oOUwgam3B8zsv
         6di0D62le6sLqA0dy+n2HyNY6lTTpIZCJ3nU9xhgWKjMza9SaOttW8h0oqUhknRI/jTK
         fmow==
X-Gm-Message-State: ACrzQf1y4ulTf/nYxi1lamUZhYecPnfwCz93Ox8ejtxzouP4u6uzVa7R
        /7q5uArT/SYmQIApssneFWrgAF/1nVg=
X-Google-Smtp-Source: AMsMyM53QteWjb971d5i1p3q0I7Tww5z1SVxysXer1q3XjnoGhzYZzFwxMaYg9nWzZpiuw8WRY5a3w==
X-Received: by 2002:ac2:55a6:0:b0:4ac:2fae:8a9e with SMTP id y6-20020ac255a6000000b004ac2fae8a9emr84549lfg.413.1667330239322;
        Tue, 01 Nov 2022 12:17:19 -0700 (PDT)
Received: from localhost.localdomain (adld223.neoplus.adsl.tpnet.pl. [79.185.7.223])
        by smtp.gmail.com with ESMTPSA id g26-20020a2eb5da000000b002770f7d8dcasm1860324ljn.134.2022.11.01.12.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 12:17:18 -0700 (PDT)
From:   Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] Add MSM8976 Device tree
Date:   Tue,  1 Nov 2022 20:16:19 +0100
Message-Id: <20221101191659.172416-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This patch introduce devicetree for MSM8976 SoC,
most of already supported hardware should be described there.
Note about v2:
Based on advice from Bjorn i decided to keep clocks container,
this format appears in every other qcom dts.

Changes since v1
================
1. Dropped l1 i/d cache from cpu nodes.
2. Replaced xo_board with rpmcc where possible.
3. Added base address to memory node.
4. Padded addresses to 8 digits.
5. Moved imem to mmio range.
6. Adjusted mdss te pin name.
7. Reorganized reg positions per Konrad's request.

Adam Skladowski (1):
  arm64: dts: qcom: Add MSM8976 device tree

 arch/arm64/boot/dts/qcom/msm8976.dtsi | 1310 +++++++++++++++++++++++++
 1 file changed, 1310 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi

-- 
2.25.1

