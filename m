Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55538EB64DC
	for <phone-devel@archiver.kernel.org>; Tue, 13 Jun 2023 23:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbjFMXrt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 13 Jun 2023 19:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240845AbjFMXrX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 13 Jun 2023 19:47:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CFC2D4E;
        Tue, 13 Jun 2023 16:46:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D952263C76;
        Tue, 13 Jun 2023 23:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3231FC43391;
        Tue, 13 Jun 2023 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699947;
        bh=NOHstrgnsYH2hCIi01gpwdZumfNyBqxe4i0BuHb3yQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gHUl8owdpO91a/sGDR5mR+oGiLICm7YyXwFEZQW6E6vT6lkaoLTKqowGRw2H2jbhy
         C/9w0by/Sl2hN4zFEKRVNxWR028aj59Es/Fl/bYVnWRly3vHwjd4PyZSWEJk7II9tf
         gVeLyK/7G6P1MTwYmez8xVt2lKdfFZPz5enaFNIzzxc5dRkd8hjnRoBmWBZ1eHKWtU
         zuyE1tHl7jiJaOpu8/D/XtX7Taldsxs8kaGZXGXPTG0YfQAKs5kn+NS4Vca/uD2RoP
         QITDjafk2577a68zLnwMbzfjcVV5+AeWNFXqM2EnnWfFfRgurzJIscHR6yQbP1gMwL
         LnmhjO4qowoWw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k
Date:   Tue, 13 Jun 2023 16:48:50 -0700
Message-Id: <168670013501.1400697.10513292708668127208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606211418.587676-1-marijn.suijten@somainline.org>
References: <20230606211418.587676-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 6 Jun 2023 23:14:18 +0200, Marijn Suijten wrote:
> The framebuffer configuration for edo pdx203, written in edo dtsi (which
> is overwritten in pdx206 dts for its smaller panel) has to use a
> 1096x2560 configuration as this is what the panel (and framebuffer area)
> has been initialized to.  Downstream userspace also has access to (and
> uses) this 2.5k mode by default, and only switches the panel to 4k when
> requested.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k
      commit: 223ce29c8b7e5b00f01a68387aabeefd77d97f06

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
