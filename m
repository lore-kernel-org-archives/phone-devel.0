Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524568;
	b=lErrpnK4gkBYjWudfm1AebsLbgHPigw82/PZ3QJsvIUZWwBE435xgxSUMdinckRs+9ya
	 CU64wKbb93IxHRaGjm0GNs5ijwDLqcEPOPZFGfuK9V5NNfmbBhpLZ7fUSVyQajK7RDjIC
	 W0QH3Xd4KGrgDZpcIEPQWWODhJYQ5a9MtTrsC8dub0h+PMZxa9rzDJfD1quyE3pAV5vzY
	 n+XbBR6Ry7T+0vMFOXdiXjIofXXizCAJGkdRSORxBkO2QGIpw4GtlqC0Y7mJ0s2zCblbh
	 GnKvn6Nz/1oz+jR0VURMirsIJCAFQ/4msJWHoJt1dWUwWzzdbLFsejgJN/v0a/ia7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
	b=4aaNHYhxWjPKVdqQMpArvO+I/qsg0uE8VvcDj8wQIjjk7Flcc+DadugRwTn1Pi4DEjlL
	 AxwInyC8Wk9qMY0Yk8+exD8QNmdToA//PZErQ2Kq4rZFpRgMtGbrg4r/fAtGXP532teVG
	 FPtEV8NSSAuQ9raOv2YkbQcGpqkDMH6D+nEyXYkDtSpUqeqnNqohHSbLwO8zdu7CF/YHr
	 3XTTiai9LsjVNHCroYLTgdFQFBm1ReW95oTVdV2R4VYXJNRe1HDdnl9jR4m7cIUoKehxv
	 UA9Eqq04U3jWV/eNRmV8B27CW32QzloCm+aJIM8A1ZOyn5cu3km8HGMUa/q7/CYBp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nE9Sss1A;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60D606A31C
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 19:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D60D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nE9Sss1A
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so23443075e9.0
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524566; x=1793129366; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
        b=nE9Sss1A6JrrIagj2oLOrZ5xA7aMiP8Py01Fl+A+eWG2XrHLHYXiEyEydoeMkWa/1J
         sQamhTV9IL9dl+/1t49FKXNF5jNMzYHu2CKrlVa9H8Xs1ho3x7AaPB+uQAfEVMRflWih
         HOiI4v9MEcOxlfoo+DeMF16uIejUNvT3sZKaq/Ax0wDNqpeIZY1oAuq6cfVVtYks6bqo
         yRxwRDvxk0xzIxevHspyQ+P7+r+/Gn2aAImMDSqAq90e1XYJrvGAdkjGGZR+2U6o2Vn9
         kwjDrTZvOVS55kw//ZsP2dveerWUSDVmVawsts6r+HnllLWbmsFL2cUg8ghhxbOYJrfk
         twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524566; x=1793129366;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
        b=xYgiNp1tClnqAVrhthPUxbtMGiqFG6l7b31AigByqQ1CmzlcIUWiLfwhAPoDDeMMVX
         icOac61oMHbrR7JdgsV9QZpg8aodPr9CbycDp77U79Bdw7F8If0Y5S9XLvZ9ufn48ckh
         u2A3suhoW8cuPguZCJn2l6l6Rm2cyf+ai0B3V/FcLEl+aDt3kckStAwszHpQghoV+bhw
         okia5+KCKvdkcGUHiUWSKxBnDtjkz6kq0cEB1kCUvl/xyrTeWwgTAkSdVJJrapzhw8IJ
         qBolWCobQDBr0kSk4+5/rwaVNlUiGcgvmeOQaveC3ImU8KIZX+kV6/yJVRMJSC4LUkE0
         kRCw==
X-Forwarded-Encrypted: i=1; AKwUvBzCAEIDV6uTD9Bb6VH6x+GqWnJ8FBM/Tz1LwNvbUvVomOtKexLzQ8tMLswe2HX4K3Snl4aWe9fFmQqpTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEWhZfsuAuAvwl0C4npSYQ3EsLJ/5XGWTJu2pegTz8aHHH1XzV
	3Oh1VOw2RFVwbFH/KQMgtw4us5aLDD85kXehAlPS4zei8PBL9OC7QusMIxllpeb85vI=
X-Gm-Gg: AYBFou2GQyCzqYtAqeX248llyhnEU8kS5sPmzYZicr4NMM5mRP6sdyXuzxrhwQfnKH7
	Zt2s+uqYP5igFTSTduqve1PGrqJHJ1JEHR0mlbGfIs48/rQOKZgeUH9MNYx9YvaACCwkv572Og1
	jl0ZOXMPZuobQJ8pw60JUgrsot6skFUScobh3+4iKU+RXiiVVcZ9j+qyqjNodNpEF+y5AkfpHz7
	LqaHFFOsfkc30OOsnrEg+nYJJUtCvEalnswEjhytOFxtOOoTJBnYa3VUuXwjeh+In03Iw6Tgifx
	8gtFBz3yIDdBt5E2smdvqsvT6mdDkaJAmphTg4mGtX16IufZ1JSLkvRMWSHpX3FMU1rnvUSR1Wt
	cLIL59Pqk1hAmRDaPXmMIkYEy7SNBwlSzVvtYRAOaVkAr9wT+oEV1JLOvEisKCgbEqkM+W/Fjjh
	DpNjUx+eDuC90eRFyh8IytjZPpV9bbPGCGXYjPKaNRpoT8cD0qLF07bMNLOfUCuttazwf5iTr48
	d2SAl4D0C8=
X-Received: by 2002:a05:600c:190e:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a1d76106c0mr258091055e9.25.1792524566645;
        Tue, 20 Oct 2026 12:29:26 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm1049611eec.26.2026.10.20.12.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:29:25 -0700 (PDT)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:59:15 +0530
Message-Id: <DM9WX8LJQ2VD.3QUBHZYBWDBC2@fairphone.com>
Cc: "Douglas Anderson" <dianders@chromium.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
 <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
In-Reply-To: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:05 PM IST, Konrad Dybcio wrote:
> On 10/14/26 9:13 AM, Luca Weiss wrote:
>> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>
>>>>> I'm assuming there's no pmic-glink on this device?
>>>>
>>>> I'm not quite sure yet how the USB stuff works. For sure from
>>>> observation, USB-C only works when stuff was plugged-in at boot time
>>>> (UEFI?), and charger also only supplies any power (but not actually
>>>> charging) when plugged in at boot time.
>>>
>>> This means that something is not 100% correct, for example, missing EC
>>> support.
>>=20
>> For sure some bits are missing. This laptop doesn't have an EC per-se,
>> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
>> of drivers handling EC-like functionality.
>>=20
>> So e.g. already for battery, we just talk with the sbs-battery directly.
>> I assume this will be the case for the other components on this laptop
>> as well.
>
> I guess sweeping the i2c busses would be a good start. The other day

We have one list of I2C devices from ACPI description, and a different
list from i2cdetect. They overlap to a certain extent but also have
enough bits that differ for some reason.

> we got a contribution for a SM8550-based Samsung tablet which also
> didn't have pmic-glink, but used a SM5714 IC instead:

Interesting, will keep that in mind. Difficult to figure out what an I2C
chip is based on just the address and potentially basic register reads.
Downstream Linux devicetree would help where it's not just an obscure
"EMEC" device with a million I2C addresses in ACPI.

Regards
Luca

>
> https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71=
a@dxdmail.cc/
>
> Konrad


