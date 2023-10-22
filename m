Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F0C001DF
	for <phone-devel@archiver.kernel.org>; Sun, 22 Oct 2023 11:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjJVLkr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 22 Oct 2023 07:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjJVLkq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 22 Oct 2023 07:40:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D780F7
        for <phone-devel@vger.kernel.org>; Sun, 22 Oct 2023 04:40:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31f71b25a99so1596760f8f.2
        for <phone-devel@vger.kernel.org>; Sun, 22 Oct 2023 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1697974843; x=1698579643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SAtwbRjnY+U/XLUS1QtVkAFPEpVXUGS+vk/XhP3IX0E=;
        b=MbFoa7D0K+IwxYnS6YM1aa4soBreWtqsQ7o+8gAMNDwRlpvKngNUU+OatrNiUWZJtE
         ZoXxbOUDehfDUVrJztnyQMjB1OA89OSH+LVO1ORAqXWTZdPnGWjrG4bLUxaizmCKUitf
         bH2NTVAiLZHePZUrJCySLL0VMci7zF+FFYG2/y5fAMRiJ8JRc5YXu9L7BC1bGUIefMpq
         QPgUnnbTTpV/VGkosL/wxQdlV8P/WmQydTVp7uQDtgVnwsYjIh3BBzYa7mZ3PpGmS/eP
         guhYU8yNLE+evBlztk16ijWKw4KpLj9J3vqJLTt3Z0u2JfXWl2aH/1YZVPANzGeC2UbB
         eWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697974843; x=1698579643;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAtwbRjnY+U/XLUS1QtVkAFPEpVXUGS+vk/XhP3IX0E=;
        b=h/LbDD+mWA535zD/Hw3wqo49iGaoODwspetBT2tufVbG85aKVM1bNGQ513S7NS5ciu
         qwfSQhuVk3dkYtDQ0Oqi4MVIAwPnuq/5+0NU7owPOSGrnu3p1PXp+sEKpw11VmwzPfmF
         rw/3J8zfvC3yvGGYBAJ+S1ct4J21Hc5Hou+AQ82qBIPQoANeg8CKp76Kf2A/M05+eDkN
         0zKqwmIcUX/xknYf6i4SwaOtetPnHQ8xxllKS4OCihFXrrlGY2Ukt4aEok352JXwoIfM
         iCZepckXVJ+lFNGbz7WXdAYYXc9Cvb5K3eGUHLeoRS/w5hIIya5Ufhm3jlPosd5A5xbN
         JeOQ==
X-Gm-Message-State: AOJu0YwS2DfhTf94nhZZ9bCjyNNG4OEwvF/HI6y2ymS1xp5S8XSKx+LP
        xmlnRvZkTOMD6IIXkoADgvPHEw==
X-Google-Smtp-Source: AGHT+IEyoCnb5m/VQGuoPz9dsEtgdL3tEaAAIur+/1/IMdFCSP9/cbYT4lGJX1CZ3WYqfOjrj0+f5w==
X-Received: by 2002:a5d:63ce:0:b0:32d:bc6e:7f0e with SMTP id c14-20020a5d63ce000000b0032dbc6e7f0emr4913874wrw.3.1697974842829;
        Sun, 22 Oct 2023 04:40:42 -0700 (PDT)
Received: from ?IPv6:2a02:8070:d89:b820:87f5:4b33:b582:39f3? ([2a02:8070:d89:b820:87f5:4b33:b582:39f3])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b0032d886039easm5496136wrt.14.2023.10.22.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 04:40:42 -0700 (PDT)
Message-ID: <fc5234cd33b78369f792479795abd02710dfcdbf.camel@aceart.de>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5
 (2016)
From:   lukas walter <lukas.walter@aceart.de>
To:     conor@kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.walter@aceart.de, phone-devel@vger.kernel.org,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 22 Oct 2023 13:40:41 +0200
In-Reply-To: <20231022-arousal-glowing-f72c8f2e44fa@spud>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>How come this v1 has an ack?

This is supposed to be a v2, but I had problems sending it correctly,
sorry
https://patchwork.kernel.org/project/linux-arm-msm/patch/20230916134147.163=
764-1-lukas.walter@aceart.de/
