Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628B2C433DB
	for <phone-devel@archiver.kernel.org>; Fri, 12 Feb 2021 18:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3483664EA0
	for <phone-devel@archiver.kernel.org>; Fri, 12 Feb 2021 18:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhBLStv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Feb 2021 13:49:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:56350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229832AbhBLStv (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Feb 2021 13:49:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F025E64E99;
        Fri, 12 Feb 2021 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613155750;
        bh=6zu0BqZqy3FVyf5GngOwQcB/CKA2YyLJUV48F0yr+tc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dhrqwB2yTINBL1Ae4Xm5yhXzcYXqIYf4Ij653rqHE0TAAUhzxC/o+VMcyIF2InMpc
         HaIZG09AqS51guw5l0FfSK0dUOPFkVHhhxRn96CgT6COwZw95Y5GKyoytuVPlehK4t
         TZlXQgcRD5TmdLrh3Vm4XtgipRCcS85OCk9Z7aHWjzdwLJ053oYxYXJeXNNxa4NNJH
         rjXokZGfliS18or6md1B0NAN2LxRG0pXHtRkAHrOb5ylARNQng7ekIfgsQmsW+BXqf
         MAjsLwAbLGkMTvr+rSFuVQLK8z0KFxcRT78rop808utzexH0PhIOoWC/apQf9FYz6a
         17R/MDoelC5ww==
Date:   Fri, 12 Feb 2021 10:49:09 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     elder@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        davem@davemloft.net, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] net: ipa: Add support for IPA v3.1 with GSI v1.0
Message-ID: <20210212104909.61de4664@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210211175015.200772-2-angelogioacchino.delregno@somainline.org>
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
        <20210211175015.200772-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 11 Feb 2021 18:50:09 +0100 AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the MSM8998 SoC's IPA,
> add the necessary bits for IPA version 3.1 featuring GSI 1.0,
> found on at least MSM8998.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

please check your patches with ./scripts/kernel-doc for warnings:

drivers/net/ipa/ipa_version.h:24: warning: Enum value 'IPA_VERSION_3_1' not described in enum 'ipa_version'
