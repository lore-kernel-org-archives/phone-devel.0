Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE42C6FD1F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Mar 2023 15:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjCMPKa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Mar 2023 11:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbjCMPKX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Mar 2023 11:10:23 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8486EB99
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 08:10:15 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v16so11700153wrn.0
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678720214;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUCpRORXYheczJ2BQGJRtZxa6Mp6r71UmdeitjQxYvs=;
        b=vEISzWGhiiacHYL0o52p3JLVWsJJAPdmabMYBnS2nesKpktQWvCXn2KMfv0IXkNpWq
         +Q3LbHC+GTrzs7kM6THam9xBzj6gGzfuse00gsCVO3rOHQpZqvnF27fQyhW1NiaBQXdG
         ZZiIDvWA6G1Uqyg7hIzn7SXIeUKX1ICx8E6UUNZ+cRljV/bWrg93/Ito1H0ULCzG8gY3
         s+8kBhgFqskd+ByOqmJcOlfK7Rreon1MUmlE0sGZa+l2OT00cMo49N7bqkaEXyuO2jR7
         2t24HoUXpolSg5FlaplkfthhfAf9vp3b+vimF4sMu1kCVbWA1+VoF7XmEGzUkX2Bb48j
         AVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678720214;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUCpRORXYheczJ2BQGJRtZxa6Mp6r71UmdeitjQxYvs=;
        b=05/fPXmH0X3Lm9z22LHX3AE1KQkApN7qcT1CTYWNl39wSbYumf0rm9zEpQ+VGZ9HF5
         nrAsSeIan3nq2/sw4RVALNp2G4vcl6k0cuRroymyfZZ05lJt/aH7n7Mvy3c/H0qcfNJq
         kocMz+Zc/1ke9WJzWx7kK55G7HQOwli7HuEp0N+z7gyIvpr9gypVByUj7zxaZIc+KUPp
         1ykQIrD0T8lCI6FVEgoEy9spX/FCDmIArJvRoaHQ0WfLXqwMlchvy6yYCQBkzYyfeN+D
         SL1bXP34zKNP4bJuydGj6rIXhm3TlCh2bPOkeQoUcNK44CPswAJXH/Xl4iYeRHYYmFd5
         q9tA==
X-Gm-Message-State: AO0yUKVu6KpWKOr2XjLWZGYfWP+NwDAFf/roJrihA4lq4TjyFj3iVTwL
        IE33ypYZ4dp6r44+a9frKwi5/w==
X-Google-Smtp-Source: AK7set/+LGifNvhK/I/kv9BBxsO4hCHbe7swNwWhTfx8XTxPTiY1Ws2H0VTcFWYtxno3NiyHa1z1yA==
X-Received: by 2002:a5d:69c7:0:b0:2ce:ac62:65ef with SMTP id s7-20020a5d69c7000000b002ceac6265efmr3809937wrw.31.1678720213839;
        Mon, 13 Mar 2023 08:10:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a9-20020a056000100900b002cfe466e894sm1713054wrx.38.2023.03.13.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:10:13 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jianhua Lu <lujianhua000@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313101858.14611-1-lujianhua000@gmail.com>
References: <20230313101858.14611-1-lujianhua000@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: display: panel: Add Novatek
 NT36523 bindings
Message-Id: <167872021291.3272635.16381286857035586957.b4-ty@linaro.org>
Date:   Mon, 13 Mar 2023 16:10:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Mon, 13 Mar 2023 18:18:57 +0800, Jianhua Lu wrote:
> Novatek NT36523 is a display driver IC used to drive DSI panels.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/2] dt-bindings: display: panel: Add Novatek NT36523 bindings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c61093b56a2ff15e449e8af56e96dc5a312baf25
[2/2] drm/panel: Add driver for Novatek NT36523
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0993234a00451e0a5c3e47d8b0f2e01dac6cedbf

-- 
Neil

