Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727212ED16B
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963400; cv=none; b=FtqViF4NjcVMQeE2xK3szJBdQQ/IZnUGl8pjSwIhyMnEPLoliDjXhK4MOS7frckPxePCHrRfSVH6BKmvhyRQZR9vcyjaLmMrSO6gaGrHHaxic7IFvtaqA1IrRkRaZGdCfwAhvzuSbccdxJJfFV++KkXPHHZBG0zvtVLc+GSZnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963400; c=relaxed/simple;
	bh=kY5bwD/tin8m/07pjzzS8+MlMr6Emf//C8kVMc1Wo9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lisoB1RqQTh+UvfvXeLvZXj88ESZDtKqNW+/j/PMzedVnMYXORR/BTj119YJWQ835CyXr8TR/e//2X+9bGOHlwLzytc9XrBSIdjEHJEAnT+xGckiom1ldupvx4caFH3ns5zo6IUH9CreDEoiESyySptG1G8QsrNM7MAGFlrnOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUMiDsvs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUMiDsvs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59K7vlaM004476
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7cbAVS4lpZ6y0VRAxwtzCg6TdsTtz80a5PJ9G9SBSQ=; b=MUMiDsvsE2UXqS7W
	yZr2DB1p+cbEdkt60KZkhWxmpokYEh0tHEz9eyDagjqQFk4lUV/himQoBqh6+PxR
	D89/uTMapz3H5g7c6EgBLJwR+CHTBIQi0B4O334JZoN8vcZF+EGFaJVGacuomRbv
	fgXphJO4cIw28hTpwVcj6nS1XCvbvi2za9wX9p9N4l1PQtnyYeIc6xx9xy3mOLAy
	k2R9qRQVdnPy24VkYNcb6wPfqH8HSKVWF5rUVTBnRZ44Pa0kK2u5mQweNSf4J5TM
	PLUqGbJ6bMkW9LyrvV9EMg2sfZ8kfh7YH6DPphiY/M+vJoc3K2MyYicVb+zTn63O
	XfAMuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469cmrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:29:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890921c382eso126590085a.1
        for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 05:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760963397; x=1761568197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7cbAVS4lpZ6y0VRAxwtzCg6TdsTtz80a5PJ9G9SBSQ=;
        b=kqb9Tgq2hBc20pkntzejU9Z9Q4mvMgtJctUW3mapi/puA84cERhuDD28ewQlbqLSwf
         k7t9FGgOKYryhvlrRmCtfs/TOcidK+31inJI3cMSgXsLOUPyygss1EfCDzWc7oIQ9CpC
         80dCwt/0SfQD5+67k59u29/F3TKYgjYPW3M+4h2nzqLcIhTFi/aqhjcuJJVKo8wCgpzi
         UPceszxa1c34KTHPDCOvs/rsOas8IfaQC5HeRm5nxinMN/JkSQARPsIgXz1M8gXDxWkN
         2Y/MJ8OUgwFR1mpXlHRltrTTzNzyMyQOIx3VxqHZpYluqLXq1KSFsRi/PE5yDPgBztWo
         emYg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1an1MrdTk9cyB+tIfMHsUysysJFDpe8Uo2/l19fcJAgcW+0Do46Nn5usn2bKB82FxYM9iXSYbBxMrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgWo5bNaBBHrqjPl6tNGov7+qxpSOktpokFi1EojYPHkxX05X
	t8W61i6iXabuxYqOH8yg3y2yMU/a8llzZ0vC/UeF2QHXm30CG6KYScq38Crwq3TxdGdx5yTUtkB
	UdDMKGunxgl+5+a7xddslmRYJA6tqDpmXht0kH2chni+JQei11LiVXbfwd4rBrrMXOg==
X-Gm-Gg: ASbGncvWh9dmBz9Tj/kNzxaNBh4HG61vlZgmbhho0cVohovbdX84sXyOJl1QLBIx/rM
	paa6udHV2rwwKrpMuPk14YujBFqcUouTLchwrMJcZeLwpsWLehIZpWa2M2I4Crg1oDtjFFDpuk4
	Mk5qv+G6cVSk1aj0OLzxmiT62s8h3cnpCurmEpqGB3Q5YHC1Nqdi/3R8LeCJulIihIkBiOZzUCM
	COI0WEroZzHAIbebls2qEOVLToqmmPfHTjbi4kGZ0PACJF6U6yL1omZxhcsM6i2PCl2UAPZoDU6
	cWYtLUnmYgKfKZJ+h6rZ5puSXtlqV3AoDkS65BhXsM84EWSyFJ9LRN3wCKTotBDfdIGIFVHbQF+
	Xo11M2tux8C7sS9gUp6p875YN1GYTm3n6qRuU8ISPxVpvcWCR9gd94tXG
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr80596961cf.10.1760963397475;
        Mon, 20 Oct 2025 05:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNR/XkjXBAoi3RveOS5rUu44E6/AP4/g0pKZRGBESs7vUDC7aVr4PCy8sCjlDaEHLvbU971Q==
X-Received: by 2002:ac8:6210:0:b0:4e8:959e:440e with SMTP id d75a77b69052e-4e89d35aecfmr80596751cf.10.1760963396955;
        Mon, 20 Oct 2025 05:29:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm771820366b.40.2025.10.20.05.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:29:56 -0700 (PDT)
Message-ID: <8e957768-f03d-4204-8eab-e3f8ba3bebad@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:29:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Drop address
 and size cells from panel
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NoW5fSO8fkMO_LCKOFx9t3PhC598SZ9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX8isA9VV32CV2
 XchMsARR6J8znbXpy/Shxz5yW45tuiP2xjFkrsKuZ3egd4fBqNXPpPm7air24j4SShyv9yMiiBE
 xG5NYcq1YlzBqQvd6DscEvMwFhhPsCiWBR8lVBqk+vYLez8H+z7fQ7lMIQYsaW3bVnGU4+urYkW
 ZkeTz3CWxhQW0C8zMZbiFpYuBAxPQ+Rwoit1u6GU2PplgaQy+56pH6USSjt1hUXut7fcKYIofmX
 Uo3yrZJBcD76lBqNepqySLrqR+59SVthBXM7Tr3xxq5pt/LhZDUMbZYiqY7BrQw0XzgJXWBySmu
 2Wt5qe13illNLzgX7faLY3sRbpju/WGyrmCV/jOC8HAgt2jDZRuQDAiPu/EUKqRzr1KqrVjX2+P
 II5dFt+T8vSp1F4A6NEQlejPxlGrug==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f62b46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=JIWnkRdvRZ92eSO0A0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: NoW5fSO8fkMO_LCKOFx9t3PhC598SZ9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/20/25 1:58 PM, Guido Günther wrote:
> They're set in the parent to describe the panel's reg property already.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
