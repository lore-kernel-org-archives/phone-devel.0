Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FD34C150
	for <phone-devel@vger.kernel.org>; Fri, 21 Nov 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733890; cv=none; b=syQogXXO1kPfgRRvHVbuL9fwQTuro+l7xJoyTBvk2ofB/vA5cXx0bfHftBjb6NQd0XUJJ+vxXYi2oZmbAsYdxQh7IQ+BmLGoQlDwpWnLfi1T3unQ11ZnnGtV7QGPOqregPJuXE72eyuKAb/cS2/oPGFGgltscKroGHrBIGwuTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733890; c=relaxed/simple;
	bh=b1n4XA4q/KqpuYmnAOUEofeqlH64gZhHPubQOI/0Elg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IICAygsjwfvLfqZHvJQXj3NlrfoOweieiMbfwAXATUtcRdl4CjbL9GKYgWeBa3gjMBEmAp+xR2v38/IKy58pEDNNvgE6glDZrG6HP4lHGwfDEe6i0zonYKcdH9JLwn3S9aqb2iL1LiOve6+yTxVEgsje23zslc/DPR1oinNzK2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG2Jcnt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yjn3NbsQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PG2Jcnt2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yjn3NbsQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCd4CF2831879
	for <phone-devel@vger.kernel.org>; Fri, 21 Nov 2025 14:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2vS7u/JIbX7qlMBiy/pib9mbwHRZ6mTK+QLsUGd4KA=; b=PG2Jcnt2u8iTs6bP
	mZr0EiwyMoyFnoLOhUoTV/+IzfH2pUYw3hNRP16PlJF8H+k01/Ocnv9t8cGmvY9p
	J/lJ1piK7o65Q51sMCelEevDtZQ2sdHOoN6mAthP8paLIOmpgaciWqJ+KOoR5+yD
	rI3WCp35mi1TgJ4gX8Qpnq10luxwNUQcIYT4RYP+1URhDEclC4dAOJlRUP8hF05I
	2GD/cKozc4jZWZWOqzG55CWCjTF4nL5tV3mXJ7+d5iaUhdJQHGBTDR7PV50jJo7u
	ZFQp5tV04+y+v4yp5PAI+7eNLX9RH4OIHcAm9lHaA9LhJ4RMv+hItyoKMsoFp+4l
	V3S+Yw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq1m6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 21 Nov 2025 14:04:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559590c663bso54408e0c.3
        for <phone-devel@vger.kernel.org>; Fri, 21 Nov 2025 06:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763733887; x=1764338687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q2vS7u/JIbX7qlMBiy/pib9mbwHRZ6mTK+QLsUGd4KA=;
        b=Yjn3NbsQHGHwy86/Hbmkzx2X6NWaFPqegXZ0JGLoZHVScF7Jiap2NrGr94Sma8yFSW
         TQDwkz9eJ0gvOxJ07v6uk4ID7ARHqzX08DpN/fzZ1kTpjIdsZ7qdWSUrqFuqpWr0Y6xu
         vR1tqNSFFSfrG0M4zCbhRbgUkC7mRlbNFSp1RI8TM91Ao1MzGzWUftEDswspxYhOrdwt
         s9aBDcJ63FVI7sLdk/olYj3lV8Gah8EDCkC99Gys7nCkrgL4Ys8TSieH8lvwqOFImNeR
         WUXyn/u5tqnECx8h2Jvd/qK+t+/6rW864cL6UXy/EbkeI+Om0JR1Lna7Q1sK0sD7dueU
         b2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733887; x=1764338687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2vS7u/JIbX7qlMBiy/pib9mbwHRZ6mTK+QLsUGd4KA=;
        b=GbTSX7CJYETJdKuOrGg6kscqiVhLb4Ybngy9ucCYvfSOcyPO5tLJYL1WryD3mpA6Mo
         MqD1ev1wrNGPWOjjG/lGoG0dww9832T2etl929fR6gvIlH1uO7sA0QzEQJM/C3Ye/ufu
         cSpVf5wJsmMnrdsZzhNSq96cxStVS0qi6/T4aMrhwTgQ1LkrhfvAgGP0a7PnSv2kU06s
         p2aS0hKhj2X0jUAw5gpWL5mzvYhBOaHq9nX309tDeCGNPjBkuV1BRfmSjYX/KI+QE+QB
         5Y5/1yYobcY+5uiKnzx4Hwywv6uhV+phCGfUP8PylBznoUVgpaRLlfqcuggqgbcaZ/fl
         LsOw==
X-Forwarded-Encrypted: i=1; AJvYcCWxghSPNKUmz9ox49OE69C1roOxmyfB5H1WPedHPgXH2jCX3OaKdZJScABga4dNZuoFmhBdwC1NwehhcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGBZ9gC5nQQGaVbYbvLfV6bqFzZb3haGmDuSMILePtv67k/hb
	MzSQM0UmGebnouRk4AMRjShicbaMbWwBx8TqhF7RrUo0muJPHXClGS+B+BiVXgFBd5dTCadZ6cr
	YBsYawxKsEKfIt32dx37A/GWfIXbCoNH5DFlJrVmJMbIO+/50JofEGx9DuNZGVg7law==
X-Gm-Gg: ASbGncvot9U0Qj0cumz1SBGQzmzdEdn0TPSAuUXH5PIMWf8/Bs4bOVpBuZZlVN4A4Kt
	UnbSSJkebbIYVPZIjeOzPSpyNS/k5FdJsThkn4zNn1NH+jWHhakswCnNapwdMQ/JENr62SsshCh
	AVRXcmy54FSZwIj61bcDmwYl/GkAkzJeqMMDbnnR8Y7U2XI6EjIbwaeTt0/b8nu/svEQzj6GGA+
	MHvgjyEees2Fe9cXanqJKjlI5P6sUswfEEY8e3vL/JRSDA12cnBxhYOgq4ju4gyLr80kKA/fJyr
	mEJ5hmhBhh5sC5j/jPKoXvIlenAML1zODCp0ivx/7gOVVr777q8foLYRKVFaWFukv7977wcbzGz
	6OcBUi3YJdtk9xfAtNLFwNdIhgfSwB8KAzA03HcuSVM5fl48Ua0IF/zpwerHFRobErGg=
X-Received: by 2002:a05:6102:4b88:b0:5de:93bb:c553 with SMTP id ada2fe7eead31-5e1de3cc795mr358843137.6.1763733886754;
        Fri, 21 Nov 2025 06:04:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI/tRwgX6vGWnRBfJHVtMU3u7QzjM5Hujztw5aFw4JnxlX/tG92uN0c9gIGQKoerIaW0+tFw==
X-Received: by 2002:a05:6102:4b88:b0:5de:93bb:c553 with SMTP id ada2fe7eead31-5e1de3cc795mr358675137.6.1763733885046;
        Fri, 21 Nov 2025 06:04:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fcfd9fsm477643766b.40.2025.11.21.06.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:04:43 -0800 (PST)
Message-ID: <d7525543-8fe8-48ca-8b35-a0d087578948@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:04:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall
 sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
 <20251121-battery-hall-v2-2-d29e0828f214@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-battery-hall-v2-2-d29e0828f214@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N_l9rprXtBK4d7h7d2urg0n7v_Es_wes
X-Proofpoint-ORIG-GUID: N_l9rprXtBK4d7h7d2urg0n7v_Es_wes
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=6920717f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=sfumBXNNT5QrXeo5tVwA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwMiBTYWx0ZWRfX5lUG9Urqn2UO
 jG+IHBnLpcTO9MLWTpC/R+nPCdKXXi8fMrV4d79ZK5oCcXDGeCoOYBWGtrVvGWTyt/cQoT8nWD5
 dlwhKh+Vzl8xYKk3Jm/aeQG+w7E5u5bK2S2WgIf6hmP/uuq9XaM21I2SH02fofdDUFZcushCTBQ
 fbddPc7X+KKV7P4SjZiHEGSxe9eedOUP0d04fXkCX0QfLdtV6/KEvMepK88TKSle0PJRZP5Bp/p
 /l3qWjuhyRJYEGTnfnTXF1Uja2dQlKIFkhhCe/25WfDcBp7PGXlynItsmbg5b58f+e4nsiYxRgL
 SYTyQPtgi3MteuBLCZa6PxQG0gtmk/0eViZUB6iXdIYLlxPqwdXfOML2+3GvDL1YDYq5lABfU6I
 8ayX/XCQ5wGqoQOtGJNeKc1Gny7shA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210102

On 11/21/25 12:10 AM, Erikas Bitovtas wrote:
> This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
> sensor for which a generic "gpio-keys" device tree node configuration
> suffices.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
