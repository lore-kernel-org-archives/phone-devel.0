Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB420481230
	for <phone-devel@vger.kernel.org>; Wed, 14 Oct 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962013; cv=none; b=Pbh8i0W4EzDSH9WcYaGcnJpmSVDrh/FbGmTvh9Sr4AnRyKnZmFOwYU0Csl5y6GIgaIziGigtAaeRy3AHS8+dGgiPS226kGeN4yZUqNMXlYnvWL/24BBarMI1kHArYB5Jk3xnhIo2nGPCX7yaaeqWmFL33CwlOutxyEIdEPbx2Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962013; c=relaxed/simple;
	bh=9mrSsHPa4bXpKYKfhljS6kvWhI06svtBMx4uFYIpfjk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kkVSHNwktdPZreHhY0HBDkhPbTtigcVjGukRbvj5YMvZ6Xm+8c1T2pTrQ0QrIxclsIwmCX42ECc5t20ht1WVRn3+FxUs/qkoZ9BphjXErBGeSYXYnycklxWK5pM+E5CZd6/0CADcnTYCdiVGZhDLwegucSTh91Yyplv+u6rPhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p2VCxDwt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p2VCxDwt"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so97131466b.1
        for <phone-devel@vger.kernel.org>; Wed, 14 Oct 2026 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791962006; x=1792566806; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=p2VCxDwtL4cRd0Mklx5vTAWIWN0lL6qyf/uwatMmb1Ft6tpb0LWvc1tqF9hzUUMj5f
         psHSrVTE5dYHj6A4n1hPI0geeq9pShLwBaG1yq/gjQsZsMRD3WBo7sUSyWpKqyb4+QPf
         kv5TMdbqYQatnOdRW6Scvu7KR7r4xTYEP2DwX2SNl22wtLzMzBfAuaU5iDZhl5sYqvfS
         4LcZI9/4WuorKbwbL13cfy+pz3FKlcl0BcMIb57Uc4bTaCvpAfZ0QdbDq7QN4cl4zXI8
         UHHsWjhTnGeNJ2WkGE/ZogpHU6CkCpdTdnOoBzmSWVWx+36Ccp8hg9J5MRTSJMY6giSI
         aOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962006; x=1792566806;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=RMcnJWXrSGF0+uan8IFoc2aPrFNgnO5+o93KXuhmTBLNLcyegy3sFhUHexOw626lSX
         9Yodv+F49ejMRlB+fm0Vy1Pn6OHnw70YJPrE/k4NwRp5th+cNuYkW5r38Gv+CcWgrDOR
         I22q0xJ4I+pk62YF4u9yLuXZmqZXZi0J78EwAwdhpsoMQjGab/pjMo+iEUpqNWQydUo+
         fl9+8qJZIJzDpNrFBY9d0HMWQgsFo5vbKQm+DbIJI5mTZAbVyMD+QM4LBAr4WU/PIKyD
         PIZuHA0YDhnr+jPCSHuOXBp5yaNRRYalzVIJcJW/1pTU1DGuRT2qUreDuRBPC2lZJlep
         F/kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVD6BvcrKaM+xlmy6c7mp+0Wszxb/bk0KELfy8Ij6HbYa0RGJOQYkbJjNqkKjoKbagFFqfk6ZySsEYEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtU+GFK9fL3Pul2DJY+t0SPGf6eAA5Ec8UzhIuGEPydPP4KBvm
	txsQmRG7ZptnaYEsUUyWXnFJ1HaUzftGhRl93vysu7t9gjjVr8PDe0bdMBMuduJTKns=
X-Gm-Gg: AYBFou1M1uYdUfkYcDE9THwwn8Q0Y563Eb36TxDAoiLDtPBIpoJRiv5At/obd/2dqaF
	o6ytJ6I/cNm+dSAooPy3Z21aUZ79kO79dUlNmEO7HVrVblIfaaNH/UWOaWVVLVDXJ726/dopslK
	kBQStrWZ3trkfyLxG+Lg6z4iq6sFEFjwqfWhMm2UTPKXzQccVKtZiAS4SL41f7yhQdUJWLw0D1d
	rPWkB91MZOqY5BB3799f4LPo4VGw9W65HnOmwqxMffVqRTf/4UkdsWc9DCRXLV+sKv3dC8SH9O7
	XCLLME1pNf4AJIDWN1ufEXjVQfPFMrLXhG7EsCrkL5qB/7pd4XyIm5biuCD/2AGuOugTWpO0K6a
	xnf7x+l4jbi5ReEqcIzvQQW15WwtaFkEL6gv/a/A4N0I9lk4WUag9aAF2nIgL1aw71Dhf8Rq1sa
	eL05/PRbNHMsYDmmGuxj63akgz5h5OmIADh7AddKSTZaL+xZyrEFRhkjvmsDELeT07cHrxMrBLx
	xZ014I2g9m2NGdDs2cv9s4VtEM36WwXopQGabouVpQ=
X-Received: by 2002:a17:907:3d0f:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c31a9ff4c22mr1294994966b.9.1791962005877;
        Wed, 14 Oct 2026 00:13:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34adc25c89sm346173466b.45.2026.10.14.00.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 09:13:23 +0200
Message-Id: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Douglas Anderson"
 <dianders@chromium.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
In-Reply-To: <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>

On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> > On 10/12/26 8:11 PM, Luca Weiss wrote:
>> >> From: Jasper Korten <jja2000@gmail.com>
>> >
>> > [...]
>> >
>> >> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> >> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >
>> > Good to see the Lucas are in agreement ;)
>>=20
>> :)
>>=20
>> >
>> > [...]
>> >
>> >> +&usb_1 {
>> >> +	dr_mode =3D "host";
>> >
>> > Does OTG not "just work"?
>>=20
>> Is this a feature one would want on a laptop? On a phone for sure, but I
>> don't quite see the use case for the laptop to be a peripheral? But I
>> didn't try it, the USB basic setup was done by Jasper
>
> Why not? It's more or less the same set of usecases: USB gadget device
> (which can be a networking gadget, serial, etc).

I can give it a try!

>
>>=20
>> >
>> > I'm assuming there's no pmic-glink on this device?
>>=20
>> I'm not quite sure yet how the USB stuff works. For sure from
>> observation, USB-C only works when stuff was plugged-in at boot time
>> (UEFI?), and charger also only supplies any power (but not actually
>> charging) when plugged in at boot time.
>
> This means that something is not 100% correct, for example, missing EC
> support.

For sure some bits are missing. This laptop doesn't have an EC per-se,
it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
of drivers handling EC-like functionality.

So e.g. already for battery, we just talk with the sbs-battery directly.
I assume this will be the case for the other components on this laptop
as well.

Regards
Luca
