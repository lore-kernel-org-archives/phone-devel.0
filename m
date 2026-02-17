Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AA31A7F6
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322150; cv=none; b=mGeWkMfv8JvWFumzaTU+g1UaeKom1XkVS8a7InvP4z6v+Hlj97z6mIABerab6gwRUY62p7HO4b47kpNoYlsym+3yVfSISkhi80QOqsAOYRKAkgvMmmJneRoAUc0MGEDZ30IPFryfG+IJ8KxTaRi55K68e6Iu+OJc963t68i0ijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322150; c=relaxed/simple;
	bh=oY+fgxVJMC1euNm2QqMaakLCgd2D21WoopvIQGCFI1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcFQ44zaS7+OnGlNCz/hNVzPI2lu+99+YQQmtCVswTZ4EuoREdC5mrZtlCvFhwbGGtXDOS8qlVup2hJ+qOd1MaVu6zXPCCMs7mNc+wGMLN0SA0TQBNE/XpvndZT5F44P0Q5NkVVNoMdBIRboLj2DBdWNcnmJeNbjWW1pz6jAh7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbHFJkUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXSu26JP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbHFJkUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXSu26JP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9tTh92804570
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=; b=SbHFJkUSl8tWbq2a
	ek42CZLfZBMMeQFObaJJJm2NWJb/PwDawmTAUn1ripkYMMI08z+kGpVDCsl1r9y+
	7f6/VmKa0Uzopg5wyc6O2rSoOaDBUpDo8xMWOAOY9pD9pxTS0HZLpliL11LBfz2H
	XO9wZ5ZmT0lfqQXUi/KiqXvjCzDDlXTvTKtU/Ybw+mtE7FjBgFyOtK7deMBFKsMv
	hT24Srj/if8onSAXeUMkWz+O1R5PXHDTYIIBRqP5z87pZvCjmRH85qXaHLrbw5z6
	DnFVoPDiakPf8d73PS/TWGycR2Ia2JlAoonD64NImljs0Wnv37LtGtNzc2MBEna6
	GwBLSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujybc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:55:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso28172506d6.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 01:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771322147; x=1771926947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=;
        b=dXSu26JP3qE6QRtTY0p4QeOnNMPUvYIJWUZUYB+JC4Byk3sDEXe/lFjTmjmH5keq+s
         +Z6eS0Gf4t2eMJOJ0q4eBHlprSWgmukPlijLc82YvhDpu25mM66Oq3Hd0c/j0IatE2Zh
         RT8fU9aqFKOxx2gMVXXrBxmvOznJJ8lXBGcNQUUn+LXzjmMrML78pwUrY1DTLU1Mxyvq
         m1Ceo5eREWgRrnECYELApJtUQnaTtzEz5PP+Q/KogO3NWm+2JFjhMCQOhY2ZmnTzh+nx
         ivo93vK995FNt05qBxR50T8OKQSEO91xBh9AcvB0UkyC/NC+FybOGfNiqdshXVibFq+u
         h37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771322147; x=1771926947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tZDvB010DcisVsobvsm9FaJSN87LTi9deVu7cSebkU=;
        b=rcdh6Q0DNjYX9vOTz8hmb+WeOspuZpfxG+eNkZAeNxUBgLJuOJHi+m3hclzuPi60eW
         MCHRX34dZ1ygjLO/5wSZA/VdnVTrbaPoiqW+SE68X1reuttIM/Z0gTD/aUagsIxt98cF
         RwpAwJF3jFHACH1xf5EpW6If0qKSYpStDwxiFYMCsrUvSZrWsL97c1T9gfQMepjf4t+x
         boCS5cJF1A5+VFKjys79goHkfJYKCXhUT+muXVFzp8mO4eebA9n4O/YB65U+Vlh84V8C
         mIIhDUHxznmKM4w4qMvqZoSsBcve67FMyrAVSwCij59rR8Jnb6Ir3VVKMbw9gETfKcgB
         9J7w==
X-Forwarded-Encrypted: i=1; AJvYcCWsQt7EHYN94qBuOOnVNFQGYPiuFqqNRDR0sYOfxC0ZoYR8fwsQscUZ8p3iDD3DWN2y3Vsh0SjT0ZgCyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbxhys091lDLRF5oRF6S5fwWRE5H1mK4YTRaQgDKgGZ6hFmF41
	YNtZeLZQOos3m9+yfcLgKbVHPlYlvcyupRhDJDeqzxz8YJBH6KB9Y/lh0ezbKc5w6MVxz18dIP9
	CgtRslOVNSVd2WfWNMxc30Yvmh51vjOGtnAGHZLZGlDk3vc8qs0XaEbrg7S7nmD38dg==
X-Gm-Gg: AZuq6aK83OHIpv6JyZwuwc0YZ5PtBcEgGWEGz8Ecfct+wbq4mVzjGovkUFqM/ZecXDN
	eTcgRWw4MUSQeYQay3r/FUmFtNSw088AHeCiNT244AqV838IRVLmg/gd6OzJo2rYB2fQYhRlizD
	+If6ADWqwKHIovXz0MagD4zAT8RMWo68TS51YqWelpcLXgnq2zMvubNM3/qfxGZ4PWBoP/XOIoj
	CUCBdox7mN0ctZxvwwFvd0teD6okCP3WC/Zo1oq3F1Sh9ele17U/Se+f9YAxNqi1jc6UUBa2WkT
	wQk0GCm9OpED0cmVO1TVf1yJZcN9etILz10O3F4t98/62JIPtOijEXUAEUhwRt/peoEZ1rDfLa8
	VRZngxeXSUuDbrQxLSo6htF/sR25bkogdFmsvE/ro2ZYgZuYNFWDjzQHlAW4wg8kOXngiSzL4Xb
	TqLZE=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr139028386d6.0.1771322147203;
        Tue, 17 Feb 2026 01:55:47 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr139028256d6.0.1771322146770;
        Tue, 17 Feb 2026 01:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766459fsm343188066b.45.2026.02.17.01.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:55:46 -0800 (PST)
Message-ID: <6d7ff022-f2d5-44b3-aafc-db64af4c283a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:55:44 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xPpaByQ7pXv38zOTn_napVIIohw1sHQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4MiBTYWx0ZWRfX0XbMGBx8kLiw
 Dn9XH774mLPINGLppp5VKnfYf4Qo3k1wfLidsrOcFVl3/Ru6t5tTgDT3FA/H31+C+0gEvetzNri
 BR+WXjZzSh17VpQkBCokyd21TLqcKoTpx+yk4o9Rp2RhIQxBICBVfqIWn/EKfFQaydMlzcScA/v
 bTFmp1M+d0NTCFcCvTiIp3dBHvqwyJnAZKB22UoKTHN04ewEch+oedKO+/Eg6Mf68RGKWaBP6Sm
 gu4qPmm5eZVFaPSNJjZjV6bfa3FcbSChMh0tdk6kGvWUYboKgZAwoPKj/lYlUxGo/lUAbnboBGB
 BQcQvPhPjj5pT1P5V3Qmw2zk38m68cuDNHMfky34WIX3VchsjaV3/QRUAmUgXkEHOWGcoaWDfAl
 PDUsK6zJgcemiZlkO4RuRTGe7LQMnTPcdbGNLewcJUpoMzVf4rjRQrlJepRNuY/e38EoX4kW/Pc
 U/nrV3h9kMJ71bLrDig==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69943b23 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xPpaByQ7pXv38zOTn_napVIIohw1sHQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170082

On 2/13/26 3:21 PM, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
