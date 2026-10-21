Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578584;
	b=2fek/3Yqaa3rZgVnXdhZf86gebRg8F6KGoX7MYw6ycu6J51O/yUtRmALHCrEPwY9vQIn
	 HSykAmafcKyU04EGLTSXmFMm1co48wRPzqXDAk/wRCrCEwFUoIifedos5B1As/vQ4DLXn
	 80paDefG2N6lDD+iFrrnCWymAijGb736QAYN1a5scBgGb2IyW4z5dfp36ZU/tPZjlwjk1
	 e4TbVfG7ZX5/EPIJl7Sc80ATfjRSngDDAAKiDpenDlAjbOI06yKgmcFAZVJG/AaIuzAyV
	 8BfnJCtG2dhkdT9JcvpWj8A1OmID3jdB0CXB/OOyR6OxjPvKJEQ+iVumhbin+386++w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
	b=ya/Oy2a3npbf+UOEUgZyxHJzj14CWRhz+vrM/xfvXjh2tq7xkSPPGfMpJaJhxbLuvwxv
	 W3FT+eqsqGaNRBvn0NQHEeQcyYkHgot5JddOmaFSIfsnwHAf6mCu4oJSLAyVzyw6urkjh
	 3cGI/YzX+OeHvLy6XHdVxMpnppK7zA4qLRy3N7ZlurDR9HkxwmES1CEVc4ZEtDbeSfbdC
	 jc+HFsGgVVq8etGHmLRNebT7O/sxYEy1aQht65Q/3DkRZu62IPsCQMtgzrhuWoTlDmuU4
	 jr8bj3OJkP5p3yssxkaaUx5X1UgKUZeLTm4CBUe+I0ModTN1T05IzAaHnSxnzsvRMMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdzmc8vI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A908606A31D
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A908606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdzmc8vI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6FNx3958634
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=; b=KD0TTfdfaEkJ+Yel
	xsoKUVDsJoAGY8KnexfYH+f8Jv/TrEWvYh+k7bA+RhvgyLbR71zh6sWA8dHmswDo
	FCf+o5rV+NA0ZOROJiYVnAqNm4qPWg128eE0yICi0VKaRYBliukjgOHvlsHWeeeK
	70/jpNo/5wjEmOknYkaRhnK6WLrNi9N1AfiJSRmpwvdyRg+0sIsz53KhtLU/G/KG
	Mu0848esElpWOWpMJmdyl3Vw1xQLbNCGsmEvbMuq/UQa8tnaVJCVSaix/P0FniVF
	lWdLamL8lFa02RNlh3jBhsSl6DUGA7RqG4BYw1ECZa/MIeSG90ShUmxkmh+qaq0f
	tptwvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kf1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1688436d6.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578583; x=1793183383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=bdzmc8vI+fihp5UpEteY8hfq9tnQR//8C7bL5AN1cByjAyeD5ilxmkdxcMwwGnGJKj
         aqWNI1j/Q5SkArF7YkS5eHf06AZaPiu1KrUHlXO79KhkUw1pqaBqpR2jUhxYkYHTuVv1
         KgMab/6XABFuSPxBquwocXOY7ZV2rnuloBQyE1f2ShGUZtk4AWT+/lUlZRqwMFWn8Iu3
         fUBFQj2Q3Bf0yyhFzzZrbeC7H0WY54IjJzql3JQ3HKhs9GkLeuNS8ZdMX4O5g0xHrdQr
         QuKacvFOl4errF7/+M2zaWvajqt7JBfyJvR8ChHaNNss9eMI+zwjnbIB4+AZOKTGyRCO
         7R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578583; x=1793183383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=DAI5pxpcQBsBRBHnbTk5ZDIl2AVg6b4bWAej5dMxz9mb9Mo2nGgyDx97l4r8T2x6AY
         1ccX0ueUq9JhcsOxo4ARklv+flBuo+BZ3zNcQHrtZCWbJF/B4Ih8CXomj/Oc4j0LdtjI
         4ttsoutVLbiJ1MkYzYHX9UH3WjDT2c0/kH0gHYdIUhrKauTwZWHif16ZS2ubS2CBIm2w
         +qNF4lh2915JZhatY2WOvKUJBMOhvQf+teY6lZyxVKe3EsOGNdMPtuOVplFlv6VShkG1
         K9XD1zMU061zkQbZeqo6L0qEvaCcrpaLUl5qWvcSeD+SCXBeWfcALZTbNbsqMwr0YTQb
         ILjw==
X-Forwarded-Encrypted: i=1; AKwUvBwjJDxN8DpHdZPjHvceNbI2McNcXRIrQTTKR5XewLIIAPaj42c7pXxllTYGt/7X0Kj2ROw6hp9JnJlVog==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmyYn1lYAgzhe+UXZU15OSd7b8tv522r88Ct5tMfwh6uuGYwG0
	JT1ooHTrfjdhRKfRcovBoo9YqnX3ZgiuO9rV9MoSAcVGHwIU0vdP3VtvdnYJpw29GJ7ZEQnyvPf
	MWMa/yWFXedji5xTVOYSDM9H4/hlo7HtY19klo+ZVG/7PWSL4roI+PkQt50DoeJDZZg==
X-Gm-Gg: AYBFou10kxugYksuUQzPEYn0zCq4Us9joCLhUwnmQv4ArEwhnc74yFMEP+nA1/yPdQR
	frSU2vKgK6vHYjkEioWsiKajJxJQueZZZ/qSrabI/fRh7oez9uW0wSCe6iCp7vPn2QQJDmCVulZ
	6uI555AInLG4S2UdrpOJ8GQLPj5RvpISdA/nLhwr6ZNoyFs81EpsmLgZNHW4t5+3HM4SKrlPa6t
	bKgjaNVFF1xrjC+8kf1M/Ko+j0oJ93OVpyzyhRbp5zKfF0gfjO6/TrSbbe7UP9MlnrE/Oj9fAwV
	Pl9YOwGvHglwhF5O4YR847sbh235cf508iEbgm0Mce6t5D2bUVYAdc4fF1Xttb9QVO9Ae9mZJVe
	QM+/lvV8xw7WzhAcbX1DGEA==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26734121cf.5.1792578582613;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26733781cf.5.1792578582113;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm64407466b.78.2026.10.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:29:41 -0700 (PDT)
Message-ID: <9e60b65a-f412-4026-b84a-6a9bb8b5d42a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:29:39 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 gpi_dma0
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX6p0Ialo810Vl
 fc4mL1o1DtHEmyUy/qMJcjaMrNMNRepg4x7e5sGtqfMjtW/OZThKAvMiNMQL0h+HOKujB2fD5RT
 qZH9Fhmas4XSyvNUjSC4LOJytRKaV2DKcujQbhUyeGAPfatHK9Yox+Nb+GfEIqryCRAOq7fdvtk
 sHme4FvQV3ZQ2s8nrfZ1FwQ+//TdaejnW0wo7C7/zw9DY4a7wyUuqkmiC6/py24SUamdS+bFt+6
 DkEIvV8tjolSrqL1iDuVjrZSegZNJsE3qqg2BHKsLRiCEbBfsTp8nE+5Dvlkm0PpwZ5yLTmQ5Ah
 /TbmICRR03ZpOMgbbqrRH97Bdso9oGZvZy/I97ee2kIBRu39fJOOLLKtGRuL+RjBNlJRqnJJGeh
 8CWWihUnXi3VOX2ukJqlI6XVq4i6tmjyzFwFWi54E3G5UYmEhqRwFgqQHv0QyAWKZx5vJMzYjy5
 zo5H0uYj+XGiSkvcfRQ==
X-Proofpoint-ORIG-GUID: t4QV5QCz4rv4k18Huv1O70bgCQXOdmg9
X-Proofpoint-GUID: t4QV5QCz4rv4k18Huv1O70bgCQXOdmg9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX96OHYbwzeENt
 KxWf6OuPoLEXr9AyNFL/QySYpm28HL/czdj5XaAkuHMwU00GReRAmJJMyG4EfnvdjdEcTFjCgoF
 Os1VfSXA+LbLbsIIwWx+3VYbbeLs/Q0=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad89417 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qbaKm5uNP53N5VyfHtwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 10/16/26 8:38 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Used by not yet introduced tas2559 codec connected to the i2c5.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> We don't have upstream tas2559 driver which would use it yet,
> but the gpi_dma0 is confirmed to be used, thus let's enable it.
> ---

I can't stay this patch is wrong, but I can say it's not
particularly beneficial for both of us to go through the review
process to offload 4 boilerplate LoC that don't have a functional
effect..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
