Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04970C4332F
	for <phone-devel@archiver.kernel.org>; Tue, 27 Dec 2022 11:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiL0L44 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Dec 2022 06:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbiL0L4x (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Dec 2022 06:56:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00CFE65;
        Tue, 27 Dec 2022 03:56:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C6F061046;
        Tue, 27 Dec 2022 11:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C59C433D2;
        Tue, 27 Dec 2022 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672142211;
        bh=MVhpv8rXzR6Te24jCkntBS3xe22aOWW6rhIHAEiEsTI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=PSUPvLMAwFNazUcuumTkeUgtQFmpg2Vw/cgqNm7UwT4p+V6Any1e1GpEiBrUGc63I
         jpqUEuEjJyUZM3fBL8N/QA7A/d5CwFQTWQUrqabnWeCUFaYnJ46ZDjNbTu4fcIDVOk
         zvGW2TXYdD+BeXEtF8qzXP45KEJS3NSDcaFiEIOOAtU/oNPAZd/h9rfu2LNjp5pM2D
         3exLfJN9KJP2Sz9vWXFJ0WfnJCZa3CqT5r7q8BFevoF87UKmAmkeRzIEPusaT7wmp6
         VM4HsNIHDwpr4wmAWYz9Jp9V7Z7dvOTlJi+hFG4y728CFRfC/CMbWKO/Cw4Nh9KX0I
         vQXmATWtnoltw==
From:   Mark Brown <broonie@kernel.org>
To:     Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Jarrah Gosbell <kernel@undef.tools>
Cc:     phone-devel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
In-Reply-To: <20221209105621.39237-1-kernel@undef.tools>
References: <20221209105621.39237-1-kernel@undef.tools>
Subject: Re: [PATCH 1/2] ASoC: rt5640: Allow configuration of LOUT to mono
 differential mode
Message-Id: <167214220970.82924.10318641625938014586.b4-ty@kernel.org>
Date:   Tue, 27 Dec 2022 11:56:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 09 Dec 2022 10:56:20 +0000, Jarrah Gosbell wrote:
> LOUT output can produce either single-ended stereo signals, or mono
> differential signal. Some applications are wired to use LOUT in mono
> differential mode. Allow to configure it via device property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Allow configuration of LOUT to mono differential mode
      commit: 44b54f54b41d36e8a2302a2c18a65268751c9067
[2/2] dt-bindings: sound: rt5640: Allow to describe how LOUT is wired
      commit: d8510532ccf3bc12e2b1c0c285d4b61d4b713e1a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
