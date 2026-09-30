Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9E4D37A2
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771882; cv=none; b=tvFkUsON/HL3o4bc0bGyJuOSMhJm0KBvLI6rFefRd1uJnyIV1noRxucxHsP7muN6MdD7oF5t/SQubKyKFVXOF6NYb9HHKPapwzAb0J5/jWoLxg5SfwEII0Qzx8DWypzkYM4dfTbgReJxeFNizG4qEnV5GONMsA1BA+xxiR5eLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771882; c=relaxed/simple;
	bh=kg66g+UvDwg168UNQb/RRHCbGtBGxTEKpUOmJIOl5PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq5OktZiLiBdkOGts+u5R+l/ChKVaEQJa+irJaklYWYfXvA0xbuxQE2obiZmfjRxhj2oX7h0X6iLrJux+oRbB60zbSMDER9xr/qPS5f59UQyVPaaRDqWb/cuqyod0fjNGkzaVyea9p7R29HbJy7N2sYWQBXokFLFH9N4r/rLau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4DzFyl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjk4gBUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4DzFyl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjk4gBUk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8Vc83796694
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=; b=p4DzFyl3A3itTisH
	sBSnqoHs2b+hFtnMnFEtpqnY04hp43l7EIBRFWOJAwO2kfGMkJ61wKZqZZrB8sy8
	tP2w9NITF1QRZxxuaZKfLRY39Eoc0crEK55cZ1d+8Qs9gkiSmxripQLYQxDqSQse
	o35g6SpMXVyt5xeemne98rToC3o4ByvveF072y9NgbNfXX+/yDmmE7SbNuEol4nN
	v8utUMf/ymBEu5rjc2t3HaFFnNLk5fKGn5DJuZq1oZIOeGHikRhx5Xii16FUQs2J
	mE1vfYtc2BWeCUZCsnK3PSy7roXAeFB6i4Waq8qt/7EZOzG7XTckKszr6+sT6/Gb
	NTqlNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3kdpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so8514691cf.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790771879; x=1791376679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=cjk4gBUkIj5Ne1MdnQz6+7xl9UGfPPC2cc1bvihzHT4gZin/BlT4Y4BE3O4JcE1mv0
         hlitvf0Le4wpKHW9znp2/gTHeRzmhJZAX852fSalAHW4DBuMk/CdjV4eIxz6fTmF4aw2
         4x+Ij7h7BVOZ2+5fcscWFiWKNHzgtKy1cmERkUaxnBl+DvK4ma3Tlsm+h9SKI0I4YTHI
         hl6KoLaBPQSe/bi8X1v6iVKmJuGT04kotwcDH82ocgRJq/8klNcA3VBkksQenEhQz50G
         aVrL35rrdNDguFd4BpCGJ6F5MUP3Az9WG1NwEkLXdi1Gf9m2Ly6cQni0gBDkvxGQdzax
         xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771879; x=1791376679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=DhEQO/Ivbxpavu8C7vd8EKK53SL1xiBpa+6DmkpvQbUmH3u7z821jQwJVW9i2Fa+Hm
         561kG3hnzLUPpBacWhKaAjh4QVQLzFJ6uXa7nc49BD95kBxu5mzci+iS8kNeRPK5W7Qf
         nuPaWDS99+hHFvLMoO8qzjk+Ulx8D2Ot9JqBmP5lZsidSy/8vPkIe/qe8aP0VcQiGVgG
         NVW5VIY5AP9G8hHWlrcbIqzaJFo6p5tFcLQG7kFnAM/LyRY2j/NozA95V/ZxpMUhEU7r
         JE7YqF+sSV1IKIEPsfbReTqdtmPIiiTIUVeJ+ir7kR3yIraNe9B8die87DvM440hhQZw
         3f3A==
X-Forwarded-Encrypted: i=1; AKwUvByugvdHr+r5YspXkOYkDxLdfuMDp4JYFNNT5+GbfO/9AGk6PVsD5GplRn0WcS3eOkC/I9/eRgYWn5mNOA==@vger.kernel.org
X-Gm-Message-State: AFuF++mBKLVRrj2+REJPCaYOkdHcmGE0rVspJKtMpKnwyvMSM+/OPTL2
	yCOHfHGDDWcrTelb84XZOSmB3CVIsjpT2YH0g3ErYG0P2ItIsJ43Q/SK1hS4JgU3rf9VWGQc2bx
	4UoEBZfpI62meuFhDJRxVcCLYEl1SMFlBTwqw5EhF4VmjCzr71PUbRoTKYzZa9z0omw==
X-Gm-Gg: AYBFou2jR52uB9DCP2zecBDPtCSvabbSm44VKiVdpsJKEHaIhdgrFgl7/FhnCYlHDGe
	plnk12e15xxx1QM3P5gpCs2pLLnA+lpSwqkpchAO73gJ2ftrd5vBW2BD8WD7+J3HqXXjVNtKeSC
	OnX7sFSz2tpChDvaItFGTmhVxAKloUpinQzRZ5QHW1TKTk6CTirNR6CVWz/5ZznExXlFWRozgxt
	W1WxhMvXY+3e2Kyia/Orjc9+Q/1FhH4A3lMRjre865yftLXn96bldjht497HZKcAbQyCO6mRZ8u
	qI68VPh4/b+Ndj07F3Z5VVzrsjkurA9OZ939v07ZjSKuy7WcN/TUSoHnbSQmSPYW3owO2xdm8/T
	HyWxIgFgwqGZqiEFxscKsGA==
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170703885a.3.1790771878855;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170699185a.3.1790771878365;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9b38sm783768a12.3.2026.09.30.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:37:57 -0700 (PDT)
Message-ID: <a25bf79f-efb0-450d-bdab-6cdd857f2328@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:37:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7kP2-tMd0qh6zAnxR9QZd0rNtTSxhzdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX30FQ/YzgdGFG
 Lve196kEs4L9Nn4iu6pFHCYeNvMqOgHec8IOj4KgozXeP1Ato4wJ70QeI6pC9kvkg6kWckbsd4Y
 8Droy4OlNDaOnPfy6GaBip85AToJw1tDOHJ2hjZjtzbHauqzF/5l8qwX66N85d87rYMYoTRlhIx
 ZjYMewGcmNI2batP5qbEQA6rBvuqn1u8Wrdcl+DzCrZnO9HKxAGLBmzjkTAkfAWGHl+y1byyMoC
 7w81W96VRH9DeFCvsMlOVrKFFOdeyJslo7cYe92EN2W+YlnXx8g1XBgeFIXza+8h+4jG9CZGRt+
 I2v4WsjZ9eRd0QeQPiWKM7nYAbeMWNJLv2s/0t2Zt6z61JERCtOeiDeW11oLHlPAqVUbyoe/gDl
 SwGvBBAbXQCJFyioHPL2LZhPmvhofL4Q3Rythzb4E1u03DqPVR+u9J/226hHNOqiJ0nfKZqR71n
 ovWIxnBpsq1ZBWnbezw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8oTzDO6fz+t3
 UJynFaMsNvIVIeTM3qgLMl+gwI+pBi51SM8zN2FKVCxiXr9h4Lifm5MRZ3Pl1f91a9yvetJyQP4
 C1iQodOzH6MrX9egg65QN7NcNyzG/zE=
X-Proofpoint-GUID: 7kP2-tMd0qh6zAnxR9QZd0rNtTSxhzdv
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd02a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=GcxSr_ZgTee_yd3lG38A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

On 9/6/26 11:11 PM, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

with David's suggestion applied or not

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
