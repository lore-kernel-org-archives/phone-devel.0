Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042B3C433DB
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A498664F25
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346259AbhCBNab (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Mar 2021 08:30:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:32950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346233AbhCAXjr (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 1 Mar 2021 18:39:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C9AD60249;
        Mon,  1 Mar 2021 23:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614641904;
        bh=/zV6h06JG5jlijnHpFKtYtxRo0hsPY/l4HEU6IcCzhg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=AUnPxAyORBhRgQ3777/7UcvlbPP0zg32kiny4dLoTiep7w+9iLn0PjAsaDtoDrWEQ
         L+IIQWSDR8Ce132UaNLj3TdYpn04lKIy/X3aNd3zxLCPK4SL6GEr17vEhSbY948PYx
         QfY7Lzaad2BvxDWZm5pzMBoGGZrDEOx39oyRLCMxjaTRzjj9wnVyvhbYLkhfzqALaF
         h0fzGpZU5RBFTTvIaiw0UKejYcZipbrD1OOZJkdrKJEpVkv2Hn95hSBrzKI3GZt44S
         wrX26r0B9O8X53mPJjJuHPuVnsV9bK0VGjpRNEHvlVHCStyET/XaDM3S4GdqyaZvOq
         FLKrAV9S070+g==
From:   Mark Brown <broonie@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     martin.botka@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20210225213514.117031-1-konrad.dybcio@somainline.org>
References: <20210225213514.117031-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT P300
Message-Id: <161464183214.31485.10412405040146742381.b4-ty@kernel.org>
Date:   Mon, 01 Mar 2021 23:37:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 25 Feb 2021 22:35:13 +0100, Konrad Dybcio wrote:
> The ULT LV_P50 shares the same configuration as the other ULT LV_Pxxx
> and the ULT P300 shares the same as the other ULT Pxxx.
> 
> These two regulator types are found on PM8950 and its variants.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT P300
      commit: b15d870510c0a3910c9980ebceab885a390af60c

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
