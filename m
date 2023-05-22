Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9914BC7EE26
	for <phone-devel@archiver.kernel.org>; Mon, 22 May 2023 06:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjEVGw6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 22 May 2023 02:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjEVGw1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 22 May 2023 02:52:27 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD82213A
        for <phone-devel@vger.kernel.org>; Sun, 21 May 2023 23:50:07 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ba86ea269e0so8007067276.1
        for <phone-devel@vger.kernel.org>; Sun, 21 May 2023 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738164; x=1687330164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srw7ucIfC/5OeRnIMtL1cXf2KeT7TF+ezb33HBVqndE=;
        b=jfHJgAclYOCpZnVYwHQClOGj72/gRBDmhMr7hJi487dtvkRI8Q5DsevbASg3dJ5tYQ
         Avz9oKiKLw0jTdXnZhNRkWHSKF5G+Vu4NpY+EyJ2RWDgDmY4uST4TjFRWAEXPJOsrdgc
         b1RQGWF29DJmF+bgXTPhxv0z0qnC9aWQlw//sJEtHmraU1729Lyy8lh5lRU4SRcHw+/l
         B32rpDHxMlkjyddRFlZqAM+YzvXJRXnsM0FnBQOzE+PM+cHgyncUpLtMtT9cK/FaSIiN
         zk32BlWiwsg+JRT/jHCaa0uSd1oyKvFJWUl35J7PcuFCcWe3Sd+Ot+MaAbuK8dCA1o2B
         4+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738164; x=1687330164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srw7ucIfC/5OeRnIMtL1cXf2KeT7TF+ezb33HBVqndE=;
        b=JtBX+6oZHhprOkWv6LVT7CU8qmaaVQYkQC9cS8rb3mtjuGs9Qn1Hk8IpDlL0YifV27
         1IfeXkCk0rvVfiXioxvW3zcq+x2+H4ZrPRNLz1Wfm/fdUZCLJnildji7r28cE2CDx8gy
         fXDAS+2kKnJxQ15sureJZRyazL7U6lCs+Iv2TQJAD2B19zfrA6fJvJcQ8hZi/B1bez0/
         WpCEHIHe/eqMfLr2/r2LVAHEuZGQUDSJ6fWx5LEajfCCVSPD4n8qu/AwtPlfUjsfhYu0
         Dn5EmDKJFtM6Lt03JAvHnuGw9mK/VuJ0ik5rgELBOkOyvTPrBIgIEIuihAtEbb18NJFd
         0zsA==
X-Gm-Message-State: AC+VfDwOAj42a1Cnc/JUj0HriLpuhuWGk3g8DQ6djDqjC1p+gN370fD8
        35No/jjG+17JJuO6s0uKS9x0dLkhUrxjQksHvmgOwA==
X-Google-Smtp-Source: ACHHUZ6Q7RsqWGPIcQ3JBMdEBS4SK/jmI1H8DA8MXUBTMYlg5VmyjMYTXyn1bYRjIyiEOi9iT3uzP2Zpp6oYMCrnodE=
X-Received: by 2002:a81:88c6:0:b0:564:bc99:cde8 with SMTP id
 y189-20020a8188c6000000b00564bc99cde8mr9098144ywf.6.1684738163951; Sun, 21
 May 2023 23:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230518210246.2401737-1-linus.walleij@linaro.org>
In-Reply-To: <20230518210246.2401737-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 08:49:12 +0200
Message-ID: <CACRpkdbTgL33+KjoNx4hOsGEmqXM3Rw2HucC38stiBik=5f3eg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: mmci: Add busydetect timeout
To:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
        phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, May 18, 2023 at 11:02=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> ChangeLog v2->v3:
> - Took out the most urgent fix from the pile of changes
>   and send separately, without the rest of the refactorings
>   that were used for debugging the issue. After this the
>   Skomer and Codina with problematic eMMC boots fine.

Scratch this, while this gets the phones to boot it does not make
the eMMC partitions mountable. When I try to balance the
scheduled timeout with cancelling of the delayed work things
screw up as well, so I need to progress with the "big" patch
series, some of the other issues is coming into play as
well as it seems..

Yours,
Linus Walleij
