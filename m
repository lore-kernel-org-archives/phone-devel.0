Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAABC636CC
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 12:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbjBMMfG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjBMMfF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 07:35:05 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030D9126C3
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:01 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hx15so31409046ejc.11
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UH8/n6MCUSNvLKi8T4NPo4FxX5WkAFif6g7w09FLiU=;
        b=YkOzHQQwJ/8tAUdf0I1klUr+8rYbHDjqFnzKCHRKdCHzMeAufo6DCGP0h66D0ogSyO
         TNuFa7f1zgcDIQT609pD6VlnWps38DLHYdnsDavEGYUjyxYl+OGOlvAItd/aUuFjbWEq
         eXYP4Qud++/NUkwgXHm+bJw6gaBJjWApg70Lu1qS1S7hb7xs2RQyu5wVGDuO5DyJGNG5
         libI01K+rUNuoaCyePCDTfTawh/qdcLXf6rsmWBiADpMIxHb3Gw8CFRhVGR+ddtdre0B
         Cm+bYTvPf44nYDqjaPiEXU3U14APF7vrM7Q1QdbpVGUCk6pmHJURYbZud3DJ0J81tRic
         TgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UH8/n6MCUSNvLKi8T4NPo4FxX5WkAFif6g7w09FLiU=;
        b=JjA79EqXdf2czrl40TFjkXTJdpbfIJts3aa0JG/S3HSxIM+YDjio9THK0SReQWZeaA
         HlF7jr6ixFkFUmJigGdnDyfHEGClZytj7eBoz7ZyPylqd2pggG1OhfQgQJHn5gWPeBgz
         Gm6ZMYMTBG+TGUNZz0tu0dRrWk0dMmrULbkFUq0dZk5HUWSb6Pp8+NlfFkiLTdD8UyIj
         GW3BesgnwiBls5qOThNKVAvRiu0Y+B1Ltz7O7LoFEiO/TtiklY+wgmfLNdf+K1KoiNno
         jhxwdCJASHX5udnM+KBeDKpiAl6Nfx+ApMpELtZy3I2bIjDkWyz+YgC5jRCXDKw1uLVM
         X4Hg==
X-Gm-Message-State: AO0yUKXkdjV7oNT6jEfAkV2iJsWPBQsCwASyQuxpKd9o4JmNSNkLFnkD
        1ABnPHQjagCbUGLF2IBKRffJdDWBfzBEOw6BFDk=
X-Google-Smtp-Source: AK7set/M1QkDlPSQ4JACFlyHJWxZJ8AsNURWGyaMq84Ghm8XvgCs0ZCIKT63SHku9tcUYvguHWJ3KA==
X-Received: by 2002:a17:906:db0b:b0:87b:dc07:380f with SMTP id xj11-20020a170906db0b00b0087bdc07380fmr32159814ejb.0.1676291699593;
        Mon, 13 Feb 2023 04:34:59 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm6721858ejz.214.2023.02.13.04.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:34:59 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/2] Add pm_runtime support to SM6350 camcc
Date:   Mon, 13 Feb 2023 13:34:55 +0100
Message-Id: <20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8u6mMC/x2NywrCMBAAf6Xs2ZU82oj+ShFJtlu7h8SQ+ILSf
 zf1OAzDrFC5CFe4dCsUfkuVR2qgDx3Q4tOdUabGYJSxymiLNTo7KCQfibC80lMi33JEZ8/hNJC
 d+qCh1cFXxlB8omXv59yjOxr8SN5tLjzL9/8dr9v2A3RJgUuHAAAA
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

As pointed out during patch review, we should make sure that we turn on
the CX power domain when camcc is in use, and also disable it (or remove
our vote on it) when camcc is not in use.

For this add pm_runtime support to the driver and stick the power-domain
in the devicetree.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: add pm_runtime support
      arm64: dts: qcom: sm6350: add power domain to camcc

 arch/arm64/boot/dts/qcom/sm6350.dtsi |  2 ++
 drivers/clk/qcom/camcc-sm6350.c      | 29 ++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-sm6350-camcc-runtime_pm-639b75c3d4b1

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

