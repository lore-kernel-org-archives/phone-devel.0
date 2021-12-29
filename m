Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA62C433F5
	for <phone-devel@archiver.kernel.org>; Wed, 29 Dec 2021 17:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240960AbhL2REc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 29 Dec 2021 12:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240876AbhL2REb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:31 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A1DC06173F
        for <phone-devel@vger.kernel.org>; Wed, 29 Dec 2021 09:04:31 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x15so88658977edv.1
        for <phone-devel@vger.kernel.org>; Wed, 29 Dec 2021 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
        b=xhe6pIARJ6nLxgaxAop08bsGSZx7Kd1UHcvKv5ZPM0idYz9aF0B/bEfVlj/jBvPEtv
         EL+qyUCy17ZT5uW1wjT7/JjXHAAC22rkvHyo8Q2cuyrY5hEzFKU2LMuuPt/bEIBXMBcZ
         tsfJiiDsS97+WiMnMJrXiLSA/kDkYo4uhIiyzdEA4TAXXm+x7BPiFOBCbj5/VlAqsAvE
         2Mltoe9ZvCTgvetpz3GsLVq+0zFxvjuXZA2zLJaeFXQ4D/LPhmRyDvt4ZbQ8WqyNT3Lo
         IxkocrOxDq6U1n3AjNJu8e61H14NFTitTuJYG3isHVjxir78T+h2tld3qMIe4PnoIXv3
         MtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
        b=j4voVDHzZtZPFcrSn/gZnMKrAWnsHFMkp/ky0Z2ST2+saBVK42HoXTJU2q3BwZ7DtK
         oh1FK/ejVNxfny7sqc+xJsRvsrU8DV9+r75un/5s6HOR7rmpf91U1dP3QGzS71wilMgM
         Q76IntXvjIpfAphvH4bi6wfnErUiS83fijGNboW4I2dj6StmLTQfD73nkd8rTssTM0ux
         b3UikAv1I6yUaDAFbVPZRHCWQzg/JLXPIUbCuNne7TtMeleVULWU7BZfzLLXPHfFti66
         FLxWNj2CvfeDvoY444qTBKJXi97hMyn9mmTtTMX5z3wUNBNuxXeQU9JppzlAfa96MaEY
         PsXw==
X-Gm-Message-State: AOAM532+QHrKZNSXliGwv/dTQQ29G/JhBVabkm4HjsSonTUFdy2uGoyZ
        1LCPmT5bQH14Rtu/f83R2N/wEQ==
X-Google-Smtp-Source: ABdhPJxEun8C2Rz5QYSsXiRo78geOqzPnu/l72Y9HBWwUVyyAPVjgqYpYhJYTw9hG0hiFAmsYo+q8Q==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr25978582eds.401.1640797469905;
        Wed, 29 Dec 2021 09:04:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:29 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 0/4] Enable display backlight on Fairphone 4
Date:   Wed, 29 Dec 2021 18:03:54 +0100
Message-Id: <20211229170358.2457006-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add and enable PM6150L wled which is used for controlling the display
backlight on Fairphone 4.

This series depends on the recent wled series by Marijn Suijten,
currently applied in the for-backlight-next branch of
kernel/git/lee/backlight.git (or linux-next).

Luca Weiss (4):
  dt-bindings: backlight: qcom-wled: Add PM6150L compatible
  backlight: qcom-wled: Add PM6150L compatible
  arm64: dts: qcom: pm6150l: Add wled node
  arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED

 .../devicetree/bindings/leds/backlight/qcom-wled.yaml  |  1 +
 arch/arm64/boot/dts/qcom/pm6150l.dtsi                  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts      |  9 +++++++++
 drivers/video/backlight/qcom-wled.c                    |  1 +
 4 files changed, 21 insertions(+)

-- 
2.34.1

