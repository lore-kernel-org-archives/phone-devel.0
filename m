Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5768C1F;
	Fri, 13 Feb 2026 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771016593; cv=none; b=dUj2Xab5JLjsIkx5+kLnTdKGByoVrjeuf2evBgVe24A21GZa8DtXVX6jUxP49nEPGJhSwrr9gxcsBumHVtkRRIodvUoYzjevDJjmQLFVdmS5WBpv6kD67qd9LfWwqF+99FBkswRLdyjkDQ9E4rhmwYL5Us7Wo2t45tyW0dJMjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771016593; c=relaxed/simple;
	bh=gdTLO4tQaLUIsSNnu37MP34qBwF7Ezj08PSHn/tJOyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcI77N/IKBZt1UY10GUaUt/9fh0zWTxAx2zhpN38L8bFzAWuVWWMQ9wjEfmSxzgV+STzdjx8ncA7PMpDjXMahZaSbSkjO4akxIkBZaBfrCC+r1fEBn0E4wUywQFgKy21yWU0DeXAV7wvYNdX1Sy/EeShlF1Cpzx2/bMfB+f2ae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXe6b0jG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXe6b0jG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C393C116C6;
	Fri, 13 Feb 2026 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771016592;
	bh=gdTLO4tQaLUIsSNnu37MP34qBwF7Ezj08PSHn/tJOyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXe6b0jGJp4uX4nxU/0WQA5ioGs+TrdCLu7Mk9JIGnRlcVRTikrKDlMBKA4fXoPcW
	 FSutn+fST/hEOhbEcmN3ep5euMPR/O/0DRv363g5GTmowA5WOsZby602cvJooy30d/
	 pk0fo24cYfHP2TOgluMpGvzZJdSbd0QMX4/I58PaTX3zi0syEpu9f72cE2CylXYjzy
	 HIDXdfnwzD57+YxzlPcO811Z/DLZk58D/VIiMSGTYgS3aAru/uor+KAAoX7j0QE1Vt
	 cHCc9sZL7hr1073E/u/3KzBpIt9wYNGKeYC+LwtJFvoP5LvBiW91U5yjgsfuyQAVKK
	 9EKh2Duia5tFw==
Date: Fri, 13 Feb 2026 15:03:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall
 Effect sensor
Message-ID: <pw6lj6iiuy7se5n3eq6ekafecvlo4p3crtrtbfq54uuuejecug@56hmttjqx3dg>
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
 <qb3zeuhh5fjteyjy46e3dbsx7ktqvnuh3snqmcvquajdal6igm@fqwv7436yw3m>
 <DGDWUOV1HSXP.3DU4CCDF81T59@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGDWUOV1HSXP.3DU4CCDF81T59@fairphone.com>

On Fri, Feb 13, 2026 at 03:40:44PM +0100, Luca Weiss wrote:
> On Fri Feb 13, 2026 at 3:33 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Feb 13, 2026 at 03:21:06PM +0100, Luca Weiss wrote:
> >> Add a node for the Hall Effect sensor, used to detect whether the Flip
> >> Cover is closed or not.
> >> 
> >> The sensor is powered through vreg_l10b, so let's put a
> >> regulator-always-on on that to make sure the sensor gets power.
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >> As pointed out in v1, this would preferably go via some vdd-supply to
> >> gpio-keys, but this support does not exist yet.
> >
> > This usually means that it can be implemented by the submitter, sorry...
> 
> Honestly right now my motivation to (re-)submit Milos patches is
> dropping. Every patch series I send (cci, ufs, wifi, bluetooth, hall
> effect) is opening a new hole for yak shaving and the ones that don't
> are taking forever to land, leading to me not wanting to send more due
> to merge conflicts between the patches.
> 

Understandably so.

> For trivial things like this, shall I hide/ignore that there's a VDD for
> the hall sensor? In practice the vdd will be on 99% of the time anyways
> due to it being used for other purposes.
> 

You have marked the pin as a wakeup-source, so what is the 1% case?
Seems to me that it might be always-on.

> I do get the desire to have proper hardware description, but requiring
> submitters to yak shave their way through various subsystems of the
> kernel is a bit much.
> 

There's some things where we can not approximate the system and postpone
the proper description, because we know that we will paint ourselves
into a corner.

This is not one of them.

There's nothing preventing us from merging this, realize next week that
the 1% is worth investing in, implement the necessary support and update
the dts accordingly.

> I've just recently yak-shaved my way through a limitation of the gdsc
> driver[0] leading to some issues I could've ignored (because CCI worked
> when the display was on), but even that thread is currently stuck on
> someone explaining some intricacies of how Qualcomm SoCs work
> internally. Even though I have access to quite some Qualcomm docs about
> this SoC, I'm fairly sure there's zero docs explaining any of that what
> was asked there because it's $secret_sauce.
> 

This looks like a case where the yak herder needs to step in. Do we have
any reason to believe that Milos is the only target with this issue?

Regards,
Bjorn

> [0] https://lore.kernel.org/linux-arm-msm/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com/
> 
> Regards
> Luca
> 
> >
> >> ---
> >> Changes in v2:
> >> - Add pinctrl for gpio70
> >> - Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com
> >> ---
> >>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 ++++++++++++++++++++-
> >>  1 file changed, 20 insertions(+), 1 deletion(-)
> >> 
> 
