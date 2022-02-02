Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5138FC433EF
	for <phone-devel@archiver.kernel.org>; Wed,  2 Feb 2022 09:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245522AbiBBJjH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Feb 2022 04:39:07 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:47057 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245525AbiBBJjD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Feb 2022 04:39:03 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4E4443F6FA;
        Wed,  2 Feb 2022 10:39:00 +0100 (CET)
Date:   Wed, 2 Feb 2022 10:38:58 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc:     Marijn Suijten <marijns95@gmail.com>, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/2] config: android-recommended: Disable
 BPF_UNPRIV_DEFAULT_OFF for netd
Message-ID: <20220202093858.cmkm2z5w2fum6jit@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Marijn Suijten <marijns95@gmail.com>, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>
References: <20220202093355.108460-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202093355.108460-2-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-02-02 10:33:55, Marijn Suijten wrote:
> From: Marijn Suijten <marijns95@gmail.com>

Feel free to disregard this `From:` override, didn't catch it when
preparing the patches from a different machine.

- Marijn

> AOSP's `netd` process fails to start on Android S:
> 
>     E ClatdController: getClatEgress4MapFd() failure: Operation not permitted
>     I netd    : Initializing ClatdController: 410us
>     E netd    : Failed to start trafficcontroller: (Status[code: 1, msg: "Pinned map not accessible or does not exist: (/sys/fs/bpf/map_netd_cookie_tag_map): Operation not permitted"])
>     E netd    : CRITICAL: sleeping 60 seconds, netd exiting with failure, crash loop likely!
> 
> And on Android R:
> 
>     I ClatdController: 4.9+ kernel and device shipped with P - clat ebpf might work.
>     E ClatdController: getClatEgressMapFd() failure: Operation not permitted
>     I netd    : Initializing ClatdController: 1409us
>     E netd    : Failed to start trafficcontroller: (Status[code: 1, msg: "Pinned map not accessible or does not exist: (/sys/fs/bpf/map_netd_cookie_tag_map): Operation not permitted"])
> 
> These permission issues are caused by 08389d888287 ("bpf: Add kconfig
> knob for disabling unpriv bpf by default") because AOSP does not provide
> netd the `SYS_ADMIN` capability, and also has no userspace support for
> the `BPF` capability yet.
> 
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: John Stultz <john.stultz@linaro.org>
> [John suggested this in https://linaro.atlassian.net/browse/ACK-107?focusedCommentId=117382]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  kernel/configs/android-recommended.config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/configs/android-recommended.config b/kernel/configs/android-recommended.config
> index 22bd76e43aca..e400fbbc8aba 100644
> --- a/kernel/configs/android-recommended.config
> +++ b/kernel/configs/android-recommended.config
> @@ -1,4 +1,5 @@
>  #  KEEP ALPHABETICALLY SORTED
> +# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_LEGACY_PTYS is not set
> -- 
> 2.35.1
> 
