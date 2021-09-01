Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C0DC432BE
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B12ED6109E
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346752AbhIASIv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 1 Sep 2021 14:08:51 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:34465 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346779AbhIASIr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 1 Sep 2021 14:08:47 -0400
Date:   Wed, 01 Sep 2021 18:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630519637;
        bh=uir4PzcrAGtJv0MOdHgIa+arRXdiTMZ57zGd4NlaWNs=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Iy273D2utq+j9HfHAKnRbLZ2eW5jhWvz3Ox85lJtkns6/APwMt/ChNwdluULYoacj
         /aMn1Ssk71m520VWz9Q9XMRifom5KyYYMZJJBjvVnXJHOuVJiyedEgXXkdQtW7FdNP
         DdIBrUBj4gCV0LfmvsKNZTfQfELf/IVgzjYdGaZM=
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/2] drm/panel: Add support for LG.Philips SW43101 DSI video mode panel
Message-ID: <20210901180644.248177-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds a driver for the LG.Philips SW43101 FHD (1080x1920) 58Hz OLED DSI
video mode panel, found on the Xiaomi Mi Note 2.

Yassine Oudjana (2):
  drm/panel: Add driver for LG.Philips SW43101 DSI video mode panel
  dt-bindings: display: Add binding for LG.Philips SW43101

 .../display/panel/lgphilips,sw43101.yaml      |  52 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lgphilips-sw43101.c   | 331 ++++++++++++++++++
 4 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lgphilips-sw43101.c

--=20
2.33.0


