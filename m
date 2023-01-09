Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FF1C54EBD
	for <phone-devel@archiver.kernel.org>; Mon,  9 Jan 2023 23:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237932AbjAIXoS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjAIXoJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Jan 2023 18:44:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A774A3BEB2
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 15:44:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so15632619lfv.2
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 15:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
        b=mUEInqqmE5Fldni3KiH34BZppU4mDu8PM154qO665GpuW9DJ1ur/7pMXNGOes3kRUS
         h3PYGO3c4F5ygysUMnEgZDYLOiczF75Iu9ZTYjl9VGktg0D3rSoyHLTaKTY80b28KYhT
         C8B4MHA4w5YWGI149aZ+CZVT+X5lK5G/kgpyZ1ZDnGZ3YpzgTCn6qA7EOeAjXhWkcG7Y
         C9APCPRpLNZ8nu1EHqQfstpj1Rmhsttkv7R3prMFaXxAvqK8D9wRAS+xPsOkt2TEWiss
         Fd82u5U+omzmDl8avWr02no8pF2K2id9tLHZt/n0694gANWY4mk6c5/gopHE2Ea0+tlJ
         YW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
        b=4Paot8HM0OH6ZeZ0I8KPMYU3Pie+SOS388Q/LRCVl9qkwTIavmj0OP0fvwlLotG4KK
         oqRcGoTEHpKzhSB3nRZ9iKorsC6CCPCJ5U7Ie5XiV323kjaMSgD4wTbKbQaNYmoDsjAq
         4MYEg8YOFiQ+dcHG2fhlgFFvd3WsfjbgceZ+bJD2hkRnbEdFwJ24ngaElx689jGP0crP
         5Mx3SxVTjTmxrzPKjx2uESQdm4Gw7MV8DFmVhhGXOESgPLeDM/VFJSnq1AwbBr3H9CyI
         5hyJljoZykjkKmAVAutfKIhRruNhZU++79QJ24XJRcSziaQ0UYjcp2wwQyEmEp3gN5sT
         Vk4A==
X-Gm-Message-State: AFqh2krkjKWvzEZ7pP4cwf93+8CuggGsspLfW/3eDFh+MHW92aLarAPo
        gnd4D2l2pXSY+oClrQ/IvDegGg==
X-Google-Smtp-Source: AMrXdXsG6JZKs6w9h/gDGC5MhFo7Dfbs1u2JXcUblsbGBwML27jBekIvWXNSjt2DUKaI9NUC5WgycA==
X-Received: by 2002:a05:6512:3b0c:b0:4b1:4cc1:5ac6 with SMTP id f12-20020a0565123b0c00b004b14cc15ac6mr20815598lfv.49.1673307840097;
        Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:43:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
Date:   Tue, 10 Jan 2023 01:43:43 +0200
Message-ID: <167330408780.609993.10652879591606544377.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
References: <20221231170532.77000-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org
Message-ID: <20230109234343.ugYTdEh1GWH7A80UU6EzeIHTNp56sRBpoJXWy1b4LgQ@z>


On Sat, 31 Dec 2022 18:05:32 +0100, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/852f489b36aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
