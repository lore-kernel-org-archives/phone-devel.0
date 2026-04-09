Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7493A16A0
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723197; cv=none; b=CvmsDkgZ89cqIoRJLpM5MW66KUyBcttt6hiLdbWqwI5Ze8O2ux06oJHa1yPdZartj0dm8urRbLlUMp6ZngauLqEDyEGm6bTIFKnHYLVd6+kLaUyclbnvIAs6om42rCkds+mzEJ0xLDAG5R/3PxeN5jatnlOiXokgamYKtS6eK0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723197; c=relaxed/simple;
	bh=EuhRbZ6NpCilnQOmXdYdPa2U1G2yQC2oX9aabqLBekk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rc3gIIDaTbxUs9cw/iF3S7yqAu/FFmsmKJXtH8VPt0VNzgY2kaR5V5BEJPiv9HiiGNXTjvxaBgxa9TKVdAMH/1hL9frSZM36IjMvUQzBhgzUociJqnbSY3kkNSts2ATNiH5uulpyYc83f4qVkjTaej0LyZ/TnMB+BuwVd38Qx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=F8YKfrx0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="F8YKfrx0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9358bc9c50so82122566b.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775723194; x=1776327994; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZivT/Wgfja7s2ciPCKX2XjEYiV4fDrABVz+SXmA49Y=;
        b=F8YKfrx09xf3HEsEiLZPCjzfK56Ui0QSCWfc9Flpn/p/jP6pYv05lq8A8hbWqaNgZB
         4ifa1kEXSx5cDhQkHOquIMTKYAlSzms8Qzz9q1TMumEv/J8mtlPgiFX3Ki1uBvF+q4UC
         6zpBvniAWWbTuwdDolDdXHEIc9S/HwDzUJFYypzV/4DMXjnPouO+dMciqqCdvsjp0Sjd
         V8gigTd/kAe4Gl1JgmLq7Dz7bGP7lYKV8W+b2oAYzrkw3WvPCDdrro+yzHEuWCMVM6Uk
         RhBKaXKYs2tF5oC2D0DB3ukawNrgWeDEOmAyuICU+wW7EmDaebvIGK2bQy+KUdl4J7uB
         3pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723194; x=1776327994;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZivT/Wgfja7s2ciPCKX2XjEYiV4fDrABVz+SXmA49Y=;
        b=GaGLHx0H/x8We7QXqS1PLuFQTuuFaCTJZEkZqCO4hqMJ7T+e2QetpFY7SZNSDLizLH
         3iuQbPihn31ur+fv41ZulqbuNCu5RkLMM/uJiPUbAnpKQja/w5D6ovpdG7pR+5M2ckYo
         RT8nedI8VlYH2ntsqBw/sKom/wIFzXKpuf3tq8TfAo+ID+4M/0xKQyM/odAKXfgj8WyC
         kvIhvWJ999x2P1hMVOAJzFttPz97vQDUjuG52OXxojQnkjadJVBATzDrmQxyeM0VNeBB
         RDGsyyfZYqmSMGKt/+pMe90QLZZQMH0va5fWDOj7VltyN34453aFEYj8P4NvTR4srCAW
         Wz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcXDNE9DoZKRKaCZERNkj5SovqZ0kWKR9s85BeSJ+0XSFRm9tP/Umff8pCS6nJt9C6k/64eAwvRLfwgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbjI3uWQYE4Q3ldK9jc4wb2nRR6OEuH2clMLdfrcKbPd5L8Q1
	N1BC19YsZYYPxkVO1idPwKSIBXSTEXAY1dX5AiDJI7rNwXa+7OnB9Z0sqI5BqT78W3c=
X-Gm-Gg: AeBDieun8nF1CC2VH+7KYp7Be6jxLRLz7gA/Tkb5YVgh+y/Lqp5c4wY0DDD25y/SC1k
	ZJDkQls09mlbJVh4plWFh3rKXtsUSJOZ2gnPuud463VN0cV55do60Xg4+qDwi7w2vGTxv2v4RjY
	OJKnQxK+k5Zurk8gsHev6+nwgpWvDAWmllWEugBIwiWyfQG5Z23VLLRnHSYNVPhDLMGrALf6WE5
	LuBVUxLHO5DG2xmlr2DMjAQxS9k+P3j1q3SvILcnZBAsiztvEQ4Z6J8ijwl22tmLsWUe3DnKJ9w
	C5PT1j80FeNCJbSmR/7tWtxoPnzDayiHdHwGWYMMPkZr/pmgwcL0t46wrKOJIXNhJoL+xD1g6IC
	lJgmLtpvQHIm7qz5eE4aseJ7QHSAM2ZGEUawIYaoBnQ+vUPxvuK12ZBbJfnKVaHFX3DlD77CRKY
	9s0nsMUiEDgA3O9g1V0YFp0WGXrTbDqwljzjh/MLkgOrMEubIwMqeShqq1NL4qHZvxMsO8AzFcd
	eSSFe4=
X-Received: by 2002:a17:907:1903:b0:b97:1d24:c004 with SMTP id a640c23a62f3a-b9c6742f6b4mr1299851566b.21.1775723194150;
        Thu, 09 Apr 2026 01:26:34 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972293sm715510466b.11.2026.04.09.01.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:26:32 +0200
Message-Id: <DHOHC560BPB4.F35KB93S9D97@fairphone.com>
Cc: "Alex Elder" <elder@kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Alexander Koskovich" <akoskovich@pm.me>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
 <ku4w5dbfk4ihxfslyf7lcxtxnbzabim5mmtm7xlhqbnmav36iv@zt3dky3vbfbo>
In-Reply-To: <ku4w5dbfk4ihxfslyf7lcxtxnbzabim5mmtm7xlhqbnmav36iv@zt3dky3vbfbo>

Hi Dmitry,

On Fri Apr 3, 2026 at 9:27 PM CEST, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 06:43:52PM +0200, Luca Weiss wrote:
>> Configure and enable the node for IPA which enables mobile data on this
>> device.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index c1899db46e71..31c6d6627619 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
>>  	/* AW86938FCR vibrator @ 0x5a */
>>  };
>> =20
>> +&ipa {
>> +	firmware-name =3D "qcom/milos/fairphone/fp6/ipa_fws.mbn";
>> +	memory-region =3D <&ipa_fw_mem>;
>> +
>> +	qcom,gsi-loader =3D "self";
>
> Are these two common to all Milos devices? Should they be a part of the
> milos.dtsi?

All qcom,gsi-loader properties are in device .dts (or device-common
.dtsi) files, never in SoC .dtsi files. Based on this, I guess it would
mostly differ based on the boot firmware used. If Linux is booted in
EL2, then probably it needs to be changed?

Regards
Luca
