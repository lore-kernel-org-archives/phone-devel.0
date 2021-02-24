Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BB5C433DB
	for <phone-devel@archiver.kernel.org>; Wed, 24 Feb 2021 03:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CAA6600CC
	for <phone-devel@archiver.kernel.org>; Wed, 24 Feb 2021 03:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhBXDwD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 23 Feb 2021 22:52:03 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:42880 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230201AbhBXDwC (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 23 Feb 2021 22:52:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614138702; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4cnRCgniJA9Bd01zeYFC5LHfdofOswKtoK/8p/Q/Oig=; b=At4exdeEjJoovvcpNxB5iejrXzcdBFJ2Gwh57AyNKHcKX3C2HQpbQ1sFl308KQSjOkezsNzB
 n7or6nJo6232IqhCvoBNbh0XwNFWIMzQS8hdNal/TIch3lfZyuhWgONAZ3eMdZQdxTgVnbk1
 R1PwEFunbOZYwhgqHCNLSUdGs5w=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI5OTczNyIsICJwaG9uZS1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6035cd3048e80e1dc517a171 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:51:12
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92239C433CA; Wed, 24 Feb 2021 03:51:11 +0000 (UTC)
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EBADC433CA;
        Wed, 24 Feb 2021 03:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9EBADC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 0/2] Fix WLED FSC Sync and brightness Sync settings
Date:   Wed, 24 Feb 2021 09:20:46 +0530
Message-Id: <1614138648-2963-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The FSC (Full scale current) setting is not updated properly due to the
wrong register toggling for WLED5. Also the ILED_SYNC toggle and MOD_SYNC
toggle sequence is updated as per the hardware team recommendation to fix
the FSC update and brightness update issue.

Kiran Gunda (2):
  backlight: qcom-wled: Fix FSC update issue for WLED5
  backlight: qcom-wled: Correct the sync_toggle sequence

 drivers/video/backlight/qcom-wled.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

