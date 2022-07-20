Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE558CCA485
	for <phone-devel@archiver.kernel.org>; Wed, 20 Jul 2022 18:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiGTSJs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 20 Jul 2022 14:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbiGTSJn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 20 Jul 2022 14:09:43 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB216B26D
        for <phone-devel@vger.kernel.org>; Wed, 20 Jul 2022 11:09:40 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10d6e8990b9so9048123fac.7
        for <phone-devel@vger.kernel.org>; Wed, 20 Jul 2022 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kunDZr9Y6JPcq1sMuH+ey+Qiy1eRk3ubp6HPIIz1jJw=;
        b=ANXR3JC3bxQuM5b1p6u7etTiV20lIiUw5xrAcZXH2blgV8GU4hVbmqn8azULJyavSE
         G6pEUsd7GbEoOApiowJ+a0vtVo5x94YuJz3mIrEUij9dvTM9tEx2V0n7YYkoLNFjvOXl
         ANkERijHrfMwW3qnJFLnj9pAAwUFijGN6E5syDVTrGG6Fo+p7xwMyRcyVhGXilO3FA25
         30MRaSbmnOyzX8DGm5cE5pXXXTNsFTDrm1UX9CkkmPiuZ4EEoBl4fkzfA3M1k76B+uV9
         QvbcexQyslF1JqQyGGRGRdSv8xc+aNnUPiIb4ZGkdos6z9O4TOEtqP4xNMIEaq7wlRRP
         aLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kunDZr9Y6JPcq1sMuH+ey+Qiy1eRk3ubp6HPIIz1jJw=;
        b=6wyl9FDSil8YyllduVtbgJc6567TMpp7LTFt5poDjDa12cWpZpgfsRnT56sfcxBf38
         JpeKVTGTn5iTRGkPKnwrXP6xQV0tEX14OLMFYV8txdBwVrKDBFvCmgwYy+TZfn8p8SZB
         gZViZ8HHf3qgU7dQyLvTQZTD4C0AcgeucM6StG9qkrFUzAONKaqJsw1XQzgyBD9Kf2Db
         9hRP926GgDdwvIUuoHXzEhCkAFElvosQKUrOaCldbl9z3tqbrR5LHC8P2m4TXLH6U+6l
         tqPxlQS7nk7eTebNIOTn0y8tbERXmyAht2ZPe6QGC5yahT0ILnsbF8kK+zaX0atyPw0o
         CUew==
X-Gm-Message-State: AJIora8bDlSf5fbPPiXeiDN06hsTjrM1z+NhQbMML5k3c4bENqJ10bK+
        9iwxByVYmffWyoroGngSRf39IQ==
X-Google-Smtp-Source: AGRyM1spLCSSGvcDq6EqyJa5L/lKOksPme/eYbhxC3RUtEb3eGUglOjAIey/25NHx59vWCn2UekbYg==
X-Received: by 2002:a05:6870:468f:b0:10d:3fb6:bf89 with SMTP id a15-20020a056870468f00b0010d3fb6bf89mr3221549oap.176.1658340579832;
        Wed, 20 Jul 2022 11:09:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r131-20020acac189000000b0032e548d96e0sm1603602oif.23.2022.07.20.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:09:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sboyd@codeaurora.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        newbie13xd@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
Date:   Wed, 20 Jul 2022 13:09:37 -0500
Message-Id: <165834057116.2095894.6261608097150637601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220626164536.16011-1-newbie13xd@gmail.com>
References: <20220626164536.16011-1-newbie13xd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 26 Jun 2022 12:45:36 -0400, Stefan Hansson wrote:
> Add binding documentation for the LG G7 and LG V35 smartphones
> which are based on Snapdragon 845 (sdm845).
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
      commit: 1ef5a4d1d03cfcdb6ea24bece9e9c63ce97764fe

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
