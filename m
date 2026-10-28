Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173355;
	b=zij527K/O9yEugAIMKOjf5sWv1Tjl4A+co/diR+0KgsfpSY9iivkWNmhTM23U/nU80H5
	 3NoET9JrbmwE6goeXfp++qMjwvFZ8A3TTodPKfzuUYqL4KID0PkwR0yNIzT2YZAIKVHbm
	 bNnx+7vIJZ+hkDRXumaeA6BXHPZ/nsqK50Scwmyb3KUwygtuebXjMcFTNI0n43GC+TP/F
	 /IA4bJXfNnskFw+wKyxwJJNtIJGN8ZLY7GgNao0O4ZN1JH6xhTKllL3GYjJJLKFWYulfI
	 aozVqLuk1qyWioIf2s6cwFVe54obtIgQTLpuK0U4ZKpcGdSAQ+bbevW3nhTkKoNbA4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Subject:Message-ID:
	 Date:From:To:Cc:Reply-To:X-WS-Location:References:In-Reply-To:
	 X-Mailer:X-WS-User-Origin:X-WS-User-Mbox:X-WS-LOCALE:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=9DmLOImqHJ02dJMHrQj26fly35gJLOiNr9yA4dJIozA=;
	b=K79FpPusG3zCvDpzVPvC+gBFy8Lp/ulbAMZYaOzQeWRHr3lIwwmKq1uWRy1LkoNWdC8q
	 zG/Ez0f00mrrOOq6DztOAccwG1w5MuC/FJOf9CXePNtLQ+0LbmAlNLWNWDszd4W8UnxXw
	 7D2VjDeTBxd87F6B/16OGx4WGvQSNOqpbAXCIaV+J53F9iC5aGV8kz2eFNnqLybRDtXp0
	 Qo+xH2gfr6UNAuPlGM8IyC9XtDosOyUMe+YCPxS5aBLdJKakOwdOruwcoM4Kecqc9ZofZ
	 wG9WAlaWB1g1iJrJBSprNrgsT9IwOwMz92G6TKAvZ1sJOpjkpEVUkVsZxh6jAdkPDdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=snyders.xyz;
	spf=pass smtp.mailfrom=snyders.xyz;
	arc=none smtp.remote-ip=83.166.143.172
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB2606A31F
	for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 07:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DB2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=snyders.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snyders.xyz
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jDzpj0jrKz2Fwk;
	Wed, 28 Oct 2026 08:42:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=snyders.xyz;
	s=20251118; t=1793173340;
	bh=9DmLOImqHJ02dJMHrQj26fly35gJLOiNr9yA4dJIozA=;
	h=Subject:Date:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=nlXH7SRt4ZBw6LmlvyA5iRDdpgSbMG4/Z1G1ZSmxl7+38UqbjSSic2fgRgpC3dYTI
	 /0HQDyPN71qYfVY4D36WBLZ5Y4Pm4JKvtOC0jjZoKccW2ibbN2kIWjLiPHYXhhcZNq
	 3t8un0nZq9sowt7DiNHI3LAeh0SyzMREDsyyOIYBxcJOWzQQq1jCh3iHn/qz2epPRL
	 DXFpnyP3EtBii+ZyIIibsFounlcLcySKPSyLe6UOZWCLnnAaAMAI3wVSZLGUBic+C+
	 TsImNd2JIfQtOXqxQZTTziuC2mIXKNAy8JdKk9wv42f228AtHaqj94w6ZEbPNPGnlQ
	 rGgqt5X0oBBaQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jDzph0qM7z87K;
	Wed, 28 Oct 2026 08:42:20 +0100 (CET)
Subject: Re: [PATCH v4 2/2] power: supply: qcom_smbx: add SMB5 support
Message-ID: <468873b2-d154-4793-93b1-82816a00e580@mail.infomaniak.com>
Date: Wed, 28 Oct 2026 08:42:19 +0100
From: Robin Snyders <robin@snyders.xyz>
To: David Heidelberg <david@ixit.cz>
Cc: Casey Connolly <casey.connolly@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: Robin Snyders <robin@snyders.xyz>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
References: <20260820-submit-qcom-smbx-send-v1-v4-0-818dabb2771e@snyders.xyz>
 <20260820-submit-qcom-smbx-send-v1-v4-2-818dabb2771e@snyders.xyz>
 <6251801f-3662-4ad4-8d55-710144462010@ixit.cz>
In-Reply-To: <6251801f-3662-4ad4-8d55-710144462010@ixit.cz>
X-Mailer: Infomaniak Workspace (1.3.1384)
X-WS-User-Origin: eyJpdiI6IjhEbFU5d2JqV1RlQmJSZytpdnY1clE9PSIsInZhbHVlIjoiZENrbS9COXVReW9IT1hMaUlNS2t0UT09IiwibWFjIjoiODRmNjcwMmIxZGY5ZjVjMmEzY2M5Njc0MTAyNThmMTg5N2JjZDliMmQ5ZTZkMzk5Zjg2NTUyMzcwZjcwY2JkMCIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IjVoNy9NZDhqdlZKYXBlS0VCRWYxSGc9PSIsInZhbHVlIjoiWGozSTVHUUNvUDdHa0xsME9FaEVkQT09IiwibWFjIjoiOTY3ZThjMTU1Y2E0NzAyNDE2ZTc3Yjk1YTViODg0MjY1N2UxOGQ5ODU3ODJjZDJjNjk3Y2M3NzkxMjQ1ZWE1MSIsInRhZyI6IiJ9
X-WS-LOCALE: fr_FR
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha

On 27/10/2026 18:19, David Heidelberg wrote:
> On 20/08/2026 12:03, Robin Snyders via B4 Relay wrote:
>> +enum smb_generation {
>> +=09SMB2,
>> +=09SMB5,
>> +};
>> +
>> +#define SMB_REG_OFFSET(smb) ((smb)->gen =3D=3D SMB2 ? 0x600 : 0x100)
>> +
>
> More and more as I look at it, this shouldn't be here, but within the dev=
ice-tree as
> charger@1000 {
>     reg =3D <0x1000>, <0x1600>;  # SMB2, or
>     reg =3D <0x1000>, <0x1100>;  # SMB5
> };
>
> But see also:
> https://lore.kernel.org/all/eodzuccugtdn42basgpczett4yatyirog4nxwe5rhg5xf=
46ibp@jzcjmje4aqc3/
>
> I'll try to do some basic separation so we know what bits belongs into wh=
ich blog, keep you in CC.

Hi David,

Thanks for looking at this.

Agreed. Describing the second register block explicitly in the charger's
reg property (0x1600 on SMB2, 0x1100 on SMB5) is cleaner than deriving
its base address from the hardware generation.

For v5, I plan to extend qcom,pmi8998-charger.yaml with a second reg
entry and use that base for both the power-path status and the
effective ICL status accesses, keeping their generation-specific
register offsets.

I'd retain a driver fallback for existing PMI8998/PM660 DTBs that only
have one reg entry. The binding could still require both entries for new
SMB5 descriptions. If you or Sebastian prefer a different compatibility
approach, I'm happy to adjust.

Given Dmitry's concern about shared charger/Type-C register ownership on
SMB2 in the gen1 Type-C RFC, I'd like to coordinate v5 with your block
split so that we don't introduce conflicting register descriptions.
Please keep me in Cc.

For reference, I also audited the current v4 SMB5 accesses on PM8150B.
They are confined to the charger core (0x10xx), the DCDC status
registers (reads of 0x1108 and 0x110b), the USB input/BC1.2 registers
(0x1340-0x1380) and the watchdog/AICL registers (0x1651-0x1661).

In particular, USBIN_TYPE_C_CFG at 0x1358 is part of the USB-input
peripheral, not the dedicated Type-C port register at 0x1544. The
current SMB5 accesses do not overlap with the dedicated Type-C port
(0x1500) or PD PHY (0x1700) register accesses. The DCDC peripheral is
also used by the VBUS regulator, so this is a register-level
observation rather than a claim of exclusive peripheral ownership.

I'll update the public register-ownership note to reflect the exact v4
access paths.

Thanks,
Robin
