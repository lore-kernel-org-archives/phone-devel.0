Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF73BE633
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046452; cv=none; b=efFzw0DYU+JGnMhGAu5wyhbfiomyXBcMwJ1swT4SAAbQSU5cVNTbLjYwL51E8nzC/cWEK3lb5UKZ8fNvLtODD5PqjX87Qu+jcvEgm0YtV8gmRddLl3Yzb9vZ4Q+sXPH57o/Lw8iOKVLgMxXt9ToLaNZGQ33ijsChONXieLbby4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046452; c=relaxed/simple;
	bh=jBA+6x8hcH0vJipCTD3SzpogKQsloL+bg3h8NyoSq3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIc4AqRbYSG6wehI+boXUpyP2GjkGiElljhpyBV5dmL82Sg5BiGE9N6dh8lODJWZzvaizOrkMT5vkwJ/dqamzueEqRtxYQUmWfOgvigRHmWUfuGdohYkwZX4AW6TJB9xPPw9QV/KJCMS31TgX0VXfGC10zKqfgXpB1Z7z8VBOdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQFqchDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INAZFQtT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQFqchDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INAZFQtT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BG8K644980
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRG/454TjKTvQdtfQbktzUZ0bitbGCyvAe9Wbx2tPqc=; b=YQFqchDYSooSHPqW
	iUdXG15TWreJaEZb2uIIVOuJH+NtBttYYshqWEfPfLG2SfK7Z86QG5BKPbnS735y
	7GctEjuTPWDIcQjLvYV+kzF9nqeT5XQssfbI4GXaqUVmykudsPkRRTn+podChTzz
	lnApqCFHnnuXWUqk5hs4rqAmsy9GAMuH+9GkkFugNIqP7rrc328m3PAWYPXdEdVy
	bj6KhUEEvR8/iDmkeKQvi/QXsG2QS9hVF3qEIZoYxnk+GED4qo2xwDG4YxK21rA9
	5qXTAolUHY2UifeLJBCUO8Ai1b0wH1ZBX3E/kIstboFRh9022hjAS/ZSmifIu8Px
	JFI4Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bwbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:47:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so881491cf.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046449; x=1787651249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRG/454TjKTvQdtfQbktzUZ0bitbGCyvAe9Wbx2tPqc=;
        b=INAZFQtTI58eCD8Hl1BnH7dMFL2Utr8r8GB7SenlNnuX1Y1UF0ROo+WmOpLZ6GCW1R
         WQmX+U2yuA8jrbEJlFG/gsRfFlpBHp28EIF6btdG2JLRN6vDWwMX7vsDxwd5gXEFnAjh
         bHmMhuNCfOnRlv0DULFxnR+OyGZ1lXuCbFZJi5NtMF/j9ZE2l7oTYEPleEMKcFoExr2w
         7S3SEj4h7CL2RZgI0P6FGeZHQW+yvD4tDuV7WyEy1J5fSHmUSKoV6PuOdtiDNyw7neH1
         lkjOqpWxBpeXBKtXt6hb4FNutvGBI0Id47SkiyUkQ2W57bK3Oi/DENWSAKr3XelM6V22
         HBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046449; x=1787651249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRG/454TjKTvQdtfQbktzUZ0bitbGCyvAe9Wbx2tPqc=;
        b=C6lPbu3FShNOaMzgWRxeLrPp06q1atFsTn6tzQwwra4zQbJubAsnwIbprTAYWe+J+S
         lWKkJTQk5PEeAMBxGSdLl3KrbHPXLyn0ZXuYFm1sPx6qx2juk7WM5TsOJBiOQlMf0ycw
         NNldJxh/at3kHGT+gMWmRD+J4CQNx6IbKE5H+AbCKs2A2r7HT1lPgo+ZBf1koaqpmMh5
         tjVxc66d4WLtempBImfMb5B0Sqo+skyi4XjprEBIflepRky/eYKGza5aEWLsJmNWTcB3
         TYAMgGZsMxVELCY1D61g6us6tq7PN//1KYClDWgJaZ4F32s0MjRBjetrcB/WQaIh3nsD
         Srfw==
X-Forwarded-Encrypted: i=1; AHgh+RrNrJTBiPD7TGKwcQZWm5n9MFDBcSQaMuA02PCsXFUdVjLOar2CkiRYqYqn62rZDF+CWXdknx7txGt5vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0xp4fXK3g7wkaa34X+VjJgPgn3nbvOAD7pQrfVxAkiufIRL2
	YYl7nWu2yhkT+38LPufCnnsKqr28GhURzq+Fmr6FucVG8d1j4lqoIldfxNNdtbh31C0Uzrv7w1P
	eS3JhUbC3naVf/zYrGK3tDna5iTC2TAFLEelB5KOZbML5RaYcqSNNJAWY4P8Tvel4PBqkNmVucA
	==
X-Gm-Gg: AR+sD132GiVjMwuBj6enX3AGDGfvKJj7OZE/bwwYGb6BhLz+ZhAi7+rd+/mOJgx+CIy
	Qz0P0iQdq3Z0ooOclLPvMhkgLuN4FY3tL2X3x/GpEmIraEjWqSFU6moOKqpKNk58BFnCkrWJfNO
	lyx6DxwQ0+Ebw8csEmKCYl0wWZs1X7Fn59UcRuE6AoF75PYgp9i/IzUmAVJAxRul7AMJiQot6Ij
	w8KjKNuPdwUqJZoB5WG9kxkzHYGnTZ+9ybOHrjJTlbttDrflIpzj/rOr1+9XDnbZMpCFfZ3HvgT
	ldD1PKvXCuppFQ6Yetagzpwp5c65mQmfKOYTGMxteCPl6ZZ2ETZODz1JIp+BWQJ4YEnP1xDjic+
	TeQ1PofUpk54VhAvKPUgNF3iH
X-Received: by 2002:ac8:5d06:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52d85140883mr217669371cf.0.1787046449499;
        Tue, 18 Aug 2026 02:47:29 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52d85140883mr217669151cf.0.1787046449022;
        Tue, 18 Aug 2026 02:47:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fd2c8d2sm158662566b.0.2026.08.18.02.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:47:28 -0700 (PDT)
Message-ID: <5b1f237a-8675-47ae-9546-64b68c5d59f6@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:47:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
 <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
 <8f05bf47-183f-4586-8ed2-eb2277f15c98@oss.qualcomm.com>
 <b8cb7327-1e1b-4a44-ac97-dec9b6c32e9e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8cb7327-1e1b-4a44-ac97-dec9b6c32e9e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pNtOAiZGY2Fx_zMD367tszzLqTTdsuAr
X-Proofpoint-ORIG-GUID: pNtOAiZGY2Fx_zMD367tszzLqTTdsuAr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MSBTYWx0ZWRfX60v97JdYCOcG
 TO8+VA53MxzHCs683Hj+pUpy3tw2oUuDHdN/FAuV/rZaNM8xdVSMFZ+L+KLlBWcImJC9hmyhG1S
 NUcDWRvu5SB3ujEo66Oy9O0R1D+Xeug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MSBTYWx0ZWRfX4vMXLzsSYd5G
 ApMymlq23Rj0nBEmTcM6J+M2/L1XH6DMNSH3cwJgN5tyNPixSrOxsM+UMe8ds0H+e342qCvN6K0
 twV7HNs7dBTX3+ZdpPBtuxwuKdG4JpDcEyhNHd4IsZzuX7NjiISjk1vtoj6kBjod5QNlBEpKrA6
 jx9T8udNY+v8PQTVxmZOGdnoMc7ZR5vQ/Y0/FSv/yAf2czVY+6BkcOLT4UrPvXZcgECTjoKU0mi
 3P2ivDwbnTPKGMrsGlFjNO/3W5reHJ2m80AwJDmd+waqMrbvWlR+FuhwVPzrZKUo/uom8ZMRI1G
 h3dB3rxRy9wfIBqejHa2cHoCp8RqZLhqIinBha8CbtAAM8jTwCvgYqP7HrtL4W3as15on/bzvMd
 X13+HGye3RLyJHdiGdPvd8/3ZlFwUTJ++SwD25AudQdI0SAwuoXYYr9jvElpcQs0400j2T3s/TG
 0bYCombnaLy0rVKWXJw==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a842a32 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=U4O3TpAJPbTXOJU-Q8cA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180071

On 8/18/26 11:38 AM, David Heidelberg wrote:
> On 18/08/2026 11:27, Konrad Dybcio wrote:
>> On 8/9/26 6:48 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Initial submission for one member of the prime Xiaomi Mi 8 family.
>>> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.
>>> Known differences are battery capacity and fingerprint sensor placement.
>>> This submission includes basic abstraction for other developers to be
>>> able easily extend it to support other variants.

[...]

>> No SS?
> 
> Haven't thought about it, for now my goal is upstream basic telnet/ssh + FB. Then display and touch - e.g. minimal u-boot and kernel development features and then bring the rest.

If you have an actually-superspeed cable, the link speed in fastboot
should tell you the truth, or alternatively you can try plugging it
into a DP dock on downstream

Konrad
