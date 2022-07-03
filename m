Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A6DCCA481
	for <phone-devel@archiver.kernel.org>; Sun,  3 Jul 2022 03:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbiGCD7g (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiGCD6v (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 2 Jul 2022 23:58:51 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3855AD110
        for <phone-devel@vger.kernel.org>; Sat,  2 Jul 2022 20:57:46 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id q18-20020a9d7c92000000b00616b27cda7cso5074503otn.9
        for <phone-devel@vger.kernel.org>; Sat, 02 Jul 2022 20:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sg1JuGe8NUunuT5VvGnoHM/xzW2U0bu23BAY3DCd9mM=;
        b=yqJub9mvpzQN59zZa3saThKzScm+mFApLBtp8T9+xRKmKWFACbZZOZSjk1P5GOiaUI
         tIhJSqYv5+gmDgVr7rzK8w7Um/lf23gXrZxpZrOhtl0Wp2PBB5tEiQMsvXNn8005rGqm
         RcGJTChnrSgvO5wLChL8ucHKholF/LfIljFx/dgburognCswpoiGOkjaf1YFL73FrEKn
         8rmiodktuRmRPeQfBOR61DlpTP36DEARrHDDNbR7z52phhqCH3jIkVlFMznmDu+WoSh1
         m7faH6LloCdtokOeKl3ahpT1GE19VJ7KEFvQ7KwDoq1pLpxlu8HHGi4B34Pjda5xtjG+
         yVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sg1JuGe8NUunuT5VvGnoHM/xzW2U0bu23BAY3DCd9mM=;
        b=VJRiWqY8VjR15WGijp+0Udf6pPl6abEHiwLYyFH5aO4haiDp5AIrp+CS1vxzHpcm7c
         xJ621JuLOYQy0VLeBMxMu3nBoRs4VHItZziGyOF5mh9udqbOY9wlZvrBfAhCDLUYm3x2
         QIo9xc9yvAO4kqhzbIyu0U6dHX5QMQV7V2kFsigmwmrUBeFOJ4sqtQ26z2qm2q58IaaZ
         h/LpRZcjAddwjr51+pWAZGIWMEKfQbRF19Z3O3ZnHhhAErgfB7akWeGaf2XOkquqQPIC
         HPjBkfRGa4WIyF09xxZFt1N6SwImZGwO85mDpnVzuru4WhqYzJ8hqPxh/IvpRYtEghCS
         rJnQ==
X-Gm-Message-State: AJIora9ehNB3f0dx9Xq/SLPdWYHFTfjq9hxO5Bp1To+9YNX2/ws+WPGd
        q/KkYXK2idqav7Mh+Y3gIS8Qmg==
X-Google-Smtp-Source: AGRyM1snoFXagGCa2xEjxs3qlmsK0jo4W/1lMGfF8Gi5A8It9E1ZWEDYvoF5F9HJNsvP97kqVMHvAA==
X-Received: by 2002:a9d:3e50:0:b0:616:bcbf:afed with SMTP id h16-20020a9d3e50000000b00616bcbfafedmr9801454otg.63.1656820661824;
        Sat, 02 Jul 2022 20:57:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845*: replace i2s reg with constant
Date:   Sat,  2 Jul 2022 22:56:35 -0500
Message-Id: <165682055970.445910.11507642895650379080.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220603094710.64591-1-luca.weiss@fairphone.com>
References: <20220603094710.64591-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 3 Jun 2022 11:47:09 +0200, Luca Weiss wrote:
> Make it easier to understand what the reg in those nodes is by using the
> constants provided by qcom,q6dsp-lpass-ports.h.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845*: replace i2s reg with constant
      commit: a102644dccfe3c0e91d517d3cad2b846e793eddb
[2/2] arm64: dts: qcom: sm8250: use constants for audio clocks
      commit: 7858ef3cfba2e123835b1b561deb9357afbfae29

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
