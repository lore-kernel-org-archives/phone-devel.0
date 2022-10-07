Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090DEC4332F
	for <phone-devel@archiver.kernel.org>; Fri,  7 Oct 2022 11:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJGLPc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 7 Oct 2022 07:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJGLPb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 7 Oct 2022 07:15:31 -0400
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FF3AE209;
        Fri,  7 Oct 2022 04:15:29 -0700 (PDT)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4MkQhd1BdCzDs0G;
        Fri,  7 Oct 2022 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1665141329; bh=ZeojxkKR8glYm7+VvnPQLktuz8n8YHSN+KZs3axH5YA=;
        h=From:To:Cc:Subject:Date:From;
        b=NvfhQAwHzrug7MRuqbsSgNu8hYtzMxkmSW+voHLecUqerdho8HgmmJLwsMlW4EZQw
         9Nh3QX3sFn9JE8kzt1741R7g1+ev2+hVr7AlcP+NmA2H7TP+74lUpQAmwUtKpoNLyt
         3PG/SbRZu5p0DUGyOaCIrsBWkTH1kobiNIEkRf1Y=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx0.riseup.net (Postfix) with ESMTPS id 4MkQhb4D5Vz9t2L;
        Fri,  7 Oct 2022 11:15:27 +0000 (UTC)
X-Riseup-User-ID: 5C5D09C6D4573B5476A2F60EF092E2F9B852A9EB55C810406BBF89C1073B3968
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4MkQhX75BLz5vRK;
        Fri,  7 Oct 2022 11:15:24 +0000 (UTC)
From:   Nia Espera <a5b6@riseup.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Nia Espera <a5b6@riseup.net>
Subject: [PATCH v2 0/2] Samsung s6e3fc2x01 panel driver for OnePlus 6T
Date:   Fri,  7 Oct 2022 13:14:41 +0200
Message-Id: <20221007111442.51481-1-a5b6@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This patch series adds proper support for the panel used in OnePlus 6T
smartphones (s6e3fc2x01). Previously, the panel relied on the driver
used by the sofef00 panel which failed to properly initialise it after
a reset.

Nia Espera (2):
  drivers: gpu: drm: add driver for samsung s6e3fc2x01 cmd mode panel
  drivers: gpu: drm: remove support for sofef00 driver on s6e3fc2x01
    panel

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |  17 +-
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 396 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  18 -
 5 files changed, 416 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

-- 
2.38.0

