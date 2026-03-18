Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E833B7B63
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827827; cv=none; b=owSX6oi/YqX7DA/Sc+x7GC2Ob5lO35EQUx2u3mmbwsd79YNI8IYY7AZcZ3pOS4WwvQdz6M4hgfkFOS1E7HGpYcf3/Ddfa9RPevIeIoKEhl5hhEM8l0YvdATm5b4gIqtnfsxXhQurArLgSg/A/2m9LrqC5itmYOa3+A6GwnbkgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827827; c=relaxed/simple;
	bh=OL4oKchoFswnzx2QRr0fz2Z7AnQokBGnhRRCJefe/z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSfLRHpUK+L4XaEfniU5QLVTAYvjfHxFreH22HpwQnPxBDQIWoXUbzDFPgcglBa+os3Qj/blpoo/6bpVgQuypcxbPcL1Knv9rFO9autoS/OVRFxfxRnjjAuGCKJaLrRBh93rUo+wmXKMpnfsi3FyShOwBq2Qq8fsWWDoDkGGsmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1owF/Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWsZqHhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1owF/Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWsZqHhT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I96OwE2296076
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=; b=B1owF/NfFrOQGcaU
	uBeAZAj7hNzTUfrRQs3b8tGn7rAU2+EzptVY/zvY1eXiQiEUkNf85T3cJqaysQBd
	cBWZLFOdvAkrMC1g1P+M4JI4Qs5nx+MlO4VAFaYyeUY4nWNTo3UutmGrxWuvrtxs
	m+LWYSDjq2g8V2XwHWdRhpuvXGCZ7GIMOqV97pYdiNt7rczNF5lsEILliyaVMmLC
	JbdKwehqbE011+0W3AKtMNyfQi36folBf98fuG5so0ZrtcD5kqhRIWzNeHiDzLj6
	uLwiHoX6GNHADxELEL67PlvXiC7POfCs8FpzYZo6ENMZSnupmjJ+LuuNnTStujoy
	FTtPTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83ut4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:56:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so60919726d6.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827818; x=1774432618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=;
        b=NWsZqHhTz0n9p7zqRlIiSHyDtrREwmCRPtfWWKYYHsAFLyaapo4TDFzWSVOJ4jJYl8
         8nbHenHE5IkBadSruVuQgpI8i3FLans192aAGwyPxkJMmIgiEJZiXib5u88+nB+8hYmd
         GEkgAOdz9Zu55lF0ytEkVT+WUzAKVhzkO1SKYFLpFqC0iOCAdchhFoAgXh/3i4lCUxim
         Hoy1rhpwrenIOXRmoeH1Yk17o4orISATFCMD5zuvskwN7NWs19mlkkbgcGaA3t1RtXs9
         MLb7JrvvwRdorsICkGZOzQOO84dlGPi/hzfH7x3yaYf46D8/kvZJUTtbG411xUAzLohh
         YgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827818; x=1774432618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hNx37GX3aKHJ23EGUcbBUoJYjcGIqnf+W6oBgnb+mM=;
        b=duLqndti+h8dqmcUELY8BDb7kScH6bLsSawbBor4H1Mh5sXjQc91ErYoTz3dyELm6h
         qCaQCgPlZDQPRMu0H+T5FFrE9FrXTPeTs9StuqSbnK04PJq3N6eQKsNdBFTME2sZl823
         REB5gJlI4DVXiqyRU89LfwzsMxIfbICfWan9zbSD2o/TND2QP3xE46T6aHgfDDj8M8oa
         ISRJSRfa2ZHVpKRW2MVCt958bKgxe6P5Ghk+EQcz3+Gj1W69lSsZ5HJxliUncA5Dy2ku
         VByT3RFWMvtVTy/dm4yCeWoItip7vPUlS8MNtc7cHt8PMASr6Jen6f+PANm0Wsu5Xb9o
         tTSg==
X-Forwarded-Encrypted: i=1; AJvYcCUx6MdZR3iHts8fHgomMeSeEMe22/O/nGAlqfi/yWUTR0cnlOXpig3bmqREtkzbybpxPH2MOH9XRtxm7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9I+biJDavX8yoLYbzJG51dr71cCElXBAU4YjPu3kPJuHsoDeH
	njPvVSunFVE/U8YtT4xnIWhLYLoIGIZ6eRA6fJCwkQjovcjVXr8LY6rPvGTjpvjBXtclO2SJMqO
	bhrtgudNvrLutOA9UyTOLcIuqqNZrBjevwIhgYPhwzQ+peFxsP/fmkEPlJkCnkasERw==
X-Gm-Gg: ATEYQzyUsZw2TOyZdpffJPK37QJsR7rTucQE+DbRy8VfKa3xqLg+FSmfLwRZo8y2mep
	c2xsNLx6lirqEDAm9tnxtXAAog+zIqku+FYceJLj/EbzrfTimOUltek0gRI/2yEphFURC2t+eVp
	KHLvWNOBNi4I0T4nq/qW0boJnui1mFU8+mGuLCgPDRwhuRyWdPpm3qD6pZ2FUlir5Q7xSBshdDO
	ebYKSk3/ibA99F03zt/fZ/B4Iw8/VKX3SBTQWRumSJRU/YuSHVjDNv5kKgZLfmXjyqeqq668d/s
	jrB0XDlAzIFd1TJ2v9m4G0M4oOzb0iJJzGGYgM77v5aTV9KNyzKytGbpzQK8pjeTdROnDdg6xNl
	c5WulqpuL7v92b38WYn2Hzd1+53F9Kky7M2WNirdSzzpxkU6jR+iveaojxndD2on0gwVsrK3E4M
	Pdk+o=
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr29596816d6.3.1773827818239;
        Wed, 18 Mar 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr29596726d6.3.1773827817763;
        Wed, 18 Mar 2026 02:56:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16868b5sm172231766b.30.2026.03.18.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:56:57 -0700 (PDT)
Message-ID: <98230025-ed6e-4d89-b36c-316886179087@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:56:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UWZKNQhM3fyZe09C6JeQny7CQBrlXb2m
X-Proofpoint-GUID: UWZKNQhM3fyZe09C6JeQny7CQBrlXb2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NCBTYWx0ZWRfX2iDN3hmgnZzX
 4JNuNwVeq+UAaojPSaJQdqGuPkY/x2M2o2HdkxEP4jeaP6qTYnY23ABzSlM1HkreMGB24r5AFUm
 lAWlDZrLsbXKjE3Fa81CIiTojglZqhjK/6RIE3cVa27dNLtxqjJ6QXEoNEYV7icEm/H/iDylPEa
 SHJ3n85GDnG7OCI5wMsxgENI+Xje5tbReDS4eJ9eLeF5CHp40u/Oj3/A4KWFEa9IzRQpgsljVqi
 9eFJokIJmYZcvYYRiFCQvhLXiq+cs/t7MJIw+1wSN78btiH9lsrzJGQm4LVaDtWPgbjgtLfTg9U
 NEP2zH/oUFA672DpbGn+k1XsTR/CknHG4+zwNBiqf0p/F29bMwKLjMWnkbLqe1lmqCYFiXDxlId
 sm80j5r0u7x/RLB/361o1z8Lou64nRrph1ivzj/Vlbcs8SrWcZxHP55+Y37FofVrPhEpRfa+WhA
 dh1TrRLotcSkk4QsNuA==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba76eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CgmkN4CY_FeYCb7YkRkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180084

On 3/6/26 3:01 PM, Luca Weiss wrote:
> Add the ADSP Generic Packet Router (GPR) device node as part of audio
> subsystem in Qualcomm Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

To the best of my ability:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
