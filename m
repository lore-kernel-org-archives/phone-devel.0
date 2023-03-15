Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD95CC6FD1D
	for <phone-devel@archiver.kernel.org>; Wed, 15 Mar 2023 23:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbjCOXfh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Mar 2023 19:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjCOXfA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Mar 2023 19:35:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B188C3591;
        Wed, 15 Mar 2023 16:33:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66AC061EB6;
        Wed, 15 Mar 2023 23:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1315BC4339B;
        Wed, 15 Mar 2023 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678923161;
        bh=OLXzom7Af4/8CnJn8BUkibxMAJPxCWyl5b9OnPoJNTI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fWTZ69H/2EJ181QhUuJfQZ71FXaJCw2ldCF156UUMAjt3HXR6FnWApM/FaT8p/Vuf
         tU++cwnTF/nHdhcisLMd8sSI+3qrQX5+iNdQZ9mA8ztz+DKfxcXEYynCyQ+yAHl/Cd
         3XewX3MOuJMkue6awJAhVlPcS83bswdj1YgD07V6dI1+KsoLL8DPO8mIxZzBuYSKTv
         t+Ba7Eltc/77e+sibR+VnwkMXRt7Al+rdEi3y2uOer8lySyxaTiBFLGzQoyYIqR0Hl
         QTA9hu/dJhVNCEDJJuV0F7Dddvq0q/6BCXtX1M7CzJHK3OztBrI7HyUO2/cAfOzGMj
         v3Xtc8QrKA/UA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        phone-devel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-lg-lenok: add missing reserved memory
Date:   Wed, 15 Mar 2023 16:35:13 -0700
Message-Id: <167892332560.4030021.11270591848010596829.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308-lenok-reserved-memory-v1-1-b8bf6ff01207@z3ntu.xyz>
References: <20230308-lenok-reserved-memory-v1-1-b8bf6ff01207@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 08 Mar 2023 22:06:03 +0100, Luca Weiss wrote:
> Turns out these two memory regions also need to be avoided, otherwise
> weird things will happen when Linux tries to use this memory.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8026-lg-lenok: add missing reserved memory
      commit: ecd240875e877d78fd03efbc62292f550872df3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
