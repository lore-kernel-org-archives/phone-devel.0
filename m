Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1940C61DD8
	for <phone-devel@archiver.kernel.org>; Sat, 14 Nov 2020 19:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC20A22314
	for <phone-devel@archiver.kernel.org>; Sat, 14 Nov 2020 19:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgKNT7f (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 14 Nov 2020 14:59:35 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:58396 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgKNT7f (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 14 Nov 2020 14:59:35 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 6DB808054C;
        Sat, 14 Nov 2020 20:59:32 +0100 (CET)
Date:   Sat, 14 Nov 2020 20:59:31 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: panel-simple-dsi: add samsung panels
 for OnePlus 6/T
Message-ID: <20201114195931.GB3900471@ravnborg.org>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-3-caleb@connolly.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=f9cxcILiNMCIw7iZS7cA:9 a=CjuIK1q_8ugA:10
        a=Ab_k19QNQqsA:10
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Caleb,
On Thu, Nov 12, 2020 at 04:21:30PM +0000, Caleb Connolly wrote:
> Add compatibles for the samsung,sofef00 and samsung,s6e3fc2x01 panels
> used in the OnePlus 6 & 6T respectively.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Thansk, applied to drm-misc-next.
Fixed so entries are sorted alphabetically when applying.

	Sam
