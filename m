Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCD4C433F5
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 19:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03C1061108
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 19:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345023AbhIGTCz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Sep 2021 15:02:55 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:37853 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhIGTCz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Sep 2021 15:02:55 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4886F1F8E8;
        Tue,  7 Sep 2021 21:01:46 +0200 (CEST)
Date:   Tue, 7 Sep 2021 21:01:45 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org
Subject: Re: [PATCH 1/2] drm/panel: Add driver for Novatek NT35950 DSI
 DriverIC panels
Message-ID: <20210907190145.7iqvcmjnkmz4t7jo@Marijn-Arch-PC.localdomain>
References: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2021-09-01 19:31:26, AngeloGioacchino Del Regno wrote:
> Add a driver for panels using the Novatek NT35950 Display Driver IC,
> including support for the Sharp LS055D1SX04, found in some Sony Xperia
> Z5 Premium and XZ Premium smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Somehow this got lost in the heat of the moment:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
