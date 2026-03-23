Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B638AC89
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269712; cv=none; b=DgghkQ27aVB4VOym2Rep4LtlnqHKbnPoEuQ6o7aAPWktxZ87HGQ5FHQN89Ip9aZIheFODp3CfNmTP9VEsAeIW1lFGXvT4no3fR6ydrMbnrTOf0J20F7U7Zdw7YMtrsGZvi+nPVMUNBDC6rUgHKn1y71lURIgO6fKsU17+vmElSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269712; c=relaxed/simple;
	bh=C4IWI5Urz4KtuWZUw5D8TCoVH1+d3S44prv1x9Afu9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAHvbHHM8UIsnXcCgNwZZH+I3SFG23Jq595EHLo9wblo1l0cdKEyf6i9L65jaWql1XRpwzs/jZ4/aeVB+1VOqYCp4yCp8ulGWWY9LftRvDiiV0BPl3AQKEBdgvLcQubQeqUItrcRe+yJghqpVFPkobJRvH3Wdd7Nza/3ADOGphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjKRB0zm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4hH2wnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjKRB0zm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4hH2wnE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADnes3539804
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=; b=kjKRB0zmc5+JAWHz
	2OP7xpsF8MLvUub1WowTKazhWRnlfUhbB7gQPhhD4UPUCj5h4EWgsVCtpcERMD1s
	iSmIq2L08g5mL+qmaPRCa3I7gJL69DaUErDz2m+fzznx8k9UrxG8YDY7FWiA9pge
	a/pesCVSuj5UlFMMCgDiQ5m5U/oI5CEDf0rKpIdLtbS/1kjkwrRuypfxz6QsScLC
	27PboHUGa1QQkxsn81qiyjSWDO0ZK1yXL1rpdhGKHd5uJ/Uke7liJbIusUiB1rcb
	PCQYAE2P/f4acAhIZP2QcAqfYa6RPs/e3/lYeXl0LnhyfrJh9S0dPg3RDJps2hZj
	e34BIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30frc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d15c360so32502051cf.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269709; x=1774874509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=G4hH2wnEE3CstkVko6btI3PMRA6ZNv2Y2vhpQskE2xBEJmzDQ3Ii9EDq923qaJklpZ
         pXEB+9Us4LwM99hue3S17t8qeO1KOX14PceDRH/7yHoMY46CnjjDdHQEbSiZgTZQalZi
         3NMlECY4kLGZVyhgBzdyROC7eLQaOx/O7v3tDiYsX/bDl+1rYF6Q2RKFC0oszlqEX52R
         9VVhlsoIMXXH5X+iDLiJbyCPwx6YDo6Lrwo7PCwfFQizrZssF7Qh2ryXWsp/xMOzMKjM
         g2WzfU4pAyMMasGq9yuzXCnQaNtR9hfMBoE7gw25vFGmz0M4azXJjp7mcEd7MPmjsjnl
         stkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269709; x=1774874509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=ntuaWu01rqUMlBCQqisYC6H9OyH1Y6BnbyTQHK1olcE6oUPwNtoKV4j8VF0AxnZaJf
         3iw1Tr1gEMVwzj1eKxtI688P+nyIaqlw1uz25Ir2VSzkmazSk+D+6OLX1jGPZ8aUrCqE
         5cnQnXaO0DyqATsiLAeBxXdsX0r11/tFKyaXa85aGloJHIAKzizYfdinFLOuiNFNW6R8
         Xzh/Gbw4vMwxTTkZgMl6r8VmWuMFbP0zubXFnutTlRFxu2RLP7hw/b+vzmV0eVzkdIS/
         3MUhPwWn3AgBEJBLuyTws6L+uXiUcvu8nJLc/Jjq4W3E0CKTPYepoVl5NoOkJMMINwDv
         5/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPIex1WiQ6EMmlov9gpA4zoarxRoJZZBuik+M6nALsuD4jg1jy46/YQ3IqC9vMpzxqWwfYdARC8qYGNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9wEv/2CfW3oeadU60vw7Wz6ZzPj1hINLKqsjSfCwx9vBeO8T
	UEP6BBJByg/bKC5o/OKU0ll5xsPSjVSU+2VHEFiFjc0IYlreYbWhW84w6Ncm19KSL0+E9UdbOUo
	lQd/75gXfLdE+NuEKc1wNy0fZYpRx9yR8MqjwVnRLUMEfFF9bCJW3HNPj83Hy4vg9Sw==
X-Gm-Gg: ATEYQzysXfvHI0CH08mZVSmiOGeago52HRXPyw3AZHBvxYTPRvJ9sYVkVxxd+SFruJ6
	VYtiDjZaMDZeUBhs7VRGMWhPBjAE63BGVDisfTqMOtHDh5FAm4hgic6nWgNCmruQSwIPo96Ks5/
	II5JzSHWJjm1YKkI6Om8iJkN5jqopBmfltm6gBnDvL16YppeNHqTkBG4omj/dwUlEDLeLzEKdSn
	X89TmpxLPalNJp6b8inntpmE2mKNBx4q+JniZzydOQ4ljxSjq/jB5sGQ4Aw1VcFsWMA5B24UhSa
	M0EsGJEZ+yHVZhLTpPgPw3M73zAtKUDqGKYBo7wPSczTn72PrIZbybcuj9zOFgPG2ZDknedeKih
	vi9n75Lp3SDPiFbXsRta2G4MiztzfPZEOkJZyAEqAMjAu0tNB7SKza2TMPx8G1UhztpabvZ4JYw
	N3U9w=
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728611cf.7.1774269709476;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728331cf.7.1774269709055;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm311909166b.19.2026.03.23.05.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:48 -0700 (PDT)
Message-ID: <3d20a901-0e73-4c95-8721-cf3b1265bac2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:46 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1350e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX5JDsWU/7hm8L
 KvB1DVn+8y301t0mdCrHIDnwa8RY4UyeRTBwv0qOn1ZuLkGzcMI2nLKCIWsP32xDrO0hya4aEVy
 X/cgQtBYADcwePREFhiKLyTcCWduh9ybIsC6WeMQzP7A7b8mWZyTWXhh4WsLAHexl4FGAYTv7Kh
 e8IeaGtBS3ERlvIRgM7KTZ7I9clhtPhOW7K8SXn83QCbQcGzbDx/m9tIwkqDmTyi8uZmo8n3QCB
 rM56xC9hUnOUA846ffXEHNhJ29tnozEPgyiYjKkPYphSDgkV62bEUp1gnaHUpHfI6QV70LAkU3a
 o4A8K1u4m3khEQuXSJcBnAZaoCelk5EI+AcEy6/wPyv7dNyDcbuiFllItnBQi9hWuP2d++ZiUga
 P3fAXOjpayjucqsz/JXqOskk7ZPoCRSpkSfTdVqCVdU+Zg8Dmw3ckdJf5mLG+womawxQe8ANaVW
 0dUbzGpfudXM35jljKw==
X-Proofpoint-GUID: nZldweVYoYXyJjMMoOfReTPaM5QY1i48
X-Proofpoint-ORIG-GUID: nZldweVYoYXyJjMMoOfReTPaM5QY1i48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
