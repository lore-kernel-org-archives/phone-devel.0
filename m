Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7094C4332F
	for <phone-devel@archiver.kernel.org>; Thu,  2 Nov 2023 21:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjKBVCZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 2 Nov 2023 17:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjKBVCZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 2 Nov 2023 17:02:25 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9C1194
        for <phone-devel@vger.kernel.org>; Thu,  2 Nov 2023 14:02:20 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6c3077984e8so1367046b3a.0
        for <phone-devel@vger.kernel.org>; Thu, 02 Nov 2023 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698958940; x=1699563740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPuGtKMPlEfvRS+P+xBusUQd48EgHVGydBMy1D5IEL4=;
        b=eCOLRmCofS/3Ru4fUr+jV98QuZNjY+W6xFtaZwYepsCQIxArwfbuDQtmNEpEOK5cTT
         vVvdYi7xaY9tdvuo89d0dVnJbpjFeo/XHDI1vrF1d6JsgU0DgDwF6sJ72LnCVxzbpBVR
         4mPBusHKhtyx7b+9gynEH8ygpwxsHfjoG6gSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698958940; x=1699563740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPuGtKMPlEfvRS+P+xBusUQd48EgHVGydBMy1D5IEL4=;
        b=E6oW1PGl5mcAIs+98u2dWwW8T9pgBL0pcXBioOyw+K0ecSoeMsJbkEThipqQxC3sni
         VpV6JQkwMDdXhqjj/COlYa3kfAMxTnzAaIrytArTuxZxYYYNmVzRCypHSq3LDQCmOyIu
         AvP4hCzJV/zzcWZtUYjFQGbJ7RRGTc24T8YGs96F6mbuJGr+rpPWZJ3iheNapuFTJH6+
         MkrvJfQ4IpasB2HO5vDjdNJo01uX97eV6faLQgofxbDTMe2/Uu0FhrRATN0cQ/xwfdTJ
         Pbq9OB+zltWhgdtWhtK5sBL++ZXngXm6GL3iKsp6klhjTbUKTLqrBuDzoLqn1BNUmnOG
         8CMg==
X-Gm-Message-State: AOJu0Yzo6tNU66zPcZRwx0p87MJh2i+jRJQt1Bgjn7CKz/QIc3cNSWPt
        7EIz3I0GRrxISsH6IisGxF54+Q==
X-Google-Smtp-Source: AGHT+IFYvdfRwpri72fkum0U8llMGbXB5T3T/b0kSk4KbqyH+3NrsK9gYNXQO1FoJxEDxjHW0gjP7w==
X-Received: by 2002:a05:6a00:2d0b:b0:692:6d3f:485b with SMTP id fa11-20020a056a002d0b00b006926d3f485bmr18420114pfb.3.1698958940181;
        Thu, 02 Nov 2023 14:02:20 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:a601:95c2:1e12:1936])
        by smtp.gmail.com with UTF8SMTPSA id fh21-20020a056a00391500b006b22218cb92sm172254pfb.43.2023.11.02.14.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 14:02:19 -0700 (PDT)
Date:   Thu, 2 Nov 2023 14:02:18 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Karel Balej <balejk@matfyz.cz>
Cc:     Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org,
        Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mwifiex: document use with the SD8777
 chipset
Message-ID: <ZUQOWtIofdSDHi3t@google.com>
References: <20231029111807.19261-1-balejk@matfyz.cz>
 <20231029111807.19261-2-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029111807.19261-2-balejk@matfyz.cz>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Oct 29, 2023 at 12:08:16PM +0100, Karel Balej wrote:
> Document the corresponding compatible string for the use of this driver
> with the Marvell SD8777 wireless chipset.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

FWIW, the binding looks fine from mwifiex point of view, so:

Acked-by: Brian Norris <briannorris@chromium.org>

But see cover letter. We can't merge driver support without a
linux-firmware-compatible (or otherwise redistributable) firmware, so
NAK for the series.
