Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0122ACEF
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854066; cv=none; b=ETyi0oumxnlMmiX2r4EeliSdRAlVmgt9Q55IRiQo6ZNrITmgIVqfBGhV90kDMu1ztgcDf/p3XCJfWQINmeiGvA4rdi1o6o3zV4yQEdVQhkWr+a55GLYsRMXuGN+ORjV3/ABx+JoFd5WTDXQadLC5jCFaf0C2GVlkfMd7hYfXBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854066; c=relaxed/simple;
	bh=5yqfQFrzXljuR9WcvKD23xmEcWvqoiPzYpT8pvVnSUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPWdhVRGy9OCL4m11lswU9pwVL2joHh5LHc+aey4RiQ0sppoNJIdloR5A892pfC0F1XSwMCtHKo24gkNJBQ5xyCr51E0++hczitWWppfGCpOU95wKYmUAlHgiwkrW++XDOoXQNUD5hwBrH/Z3o+eUsKjMVZ+Wv01u2K+4Fl4sXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYiyE+l6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYiyE+l6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9nIej032752
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=; b=SYiyE+l6QwX1B73R
	q2cYdl84CL4p4tXbUJuBHITc+8Y0KYkt3IT3uPiF6s7oMjSmE2IHnsqnB750uvhy
	gMS9mr8ynlH+S9NYpKshx6eXitccZRS5e3z7EmOD84aTbnuiLA4frYzf7bPBYmbX
	Mt+jbVIVF+Hgtvit3dAQfHMG8jjzXMQIFDr5Nw73ftF6NvwtpFYCniz2AbOg88FG
	vK4UfiP/4aTV1QRrmWS3//P7DWuXxkPTUm9XFfqIOO+IzX7+bK+HRfcg64OOyBNK
	DG17QjDTYg/M6aNB/PkCX471S4VY4mTxpwucays0xc7fdpRjPLyVhl8s2WlmoqLn
	6n2AMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xdb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3eeb07a05so89273085a.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854062; x=1751458862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=;
        b=M8kphkDid/lcFav4mULStF8JS8KPhBM/GtUe5+9rAtwY4SffIG9+pvtjoYIB84OEae
         O7wJdwVaXHuz9/R6zuSK9yvjnlVlfc2Ln6uRC3FMT+bWGB5ZKDF9EZ26ZYsIxG3NDxMa
         t62Yr9e5J9+6Ajp/RhW+UyptJbj+rDvDnz4A431etZhSxdg1t4X4Kva3p6NpGoGTTc9p
         DNGWb2W6371IAqvY5gLI7wnqMwm5Pjit5Po6B3WEULFSIrN2u7B5lFHVwZmQRgFw7qBa
         ZUrLnvtIaKMVJ1S+CsxahAx8VXRZNeWBEMaft2NQlAxINCash/ibFmipdAcbs4WGqCfA
         TLtw==
X-Forwarded-Encrypted: i=1; AJvYcCU1u8vjVbVgkbh/PKuWr67Mt1b1uLv3g8CPNvojcyn++GPZJuXwyJ2tx8RnT0uj7sx8GQ93SIomuIlF8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxkdc2Fg0max7rI5y4BTkiypWRtRAnuT/ROQdDwbklu1wrOZvT
	Y6VZPE328m2uD4qkpzuhwDQiltT4e6WZykTu/4lDMEaNB+8EPc7OKylRke8vTQaEg8XUVuC/DCW
	44GT7Qq7jKI3gKS6TkAINHlvyXD2j/kxAjK0XYGfY/dn2+YkGJytnDqCBT8aqUuRQfQ==
X-Gm-Gg: ASbGncuFZbwxiEsqDCB+MmVH5Rjm1I0G4h4eVXNSd1ywxcr31pIZrEysg26LSxeNGHb
	5OpeRYF2WPLPaYUtH8qzaWmouIQngXX2c1E9LSfweP16yobVL4VKBJ8+8Ulgt4aUnfWoJO/fjbH
	FXVFTQJ9h8WeeGbi6ykpapT3wDWsKHz8sUOBRkIVpS/LW+//6Z+bV8AAZSm7oGDUuTddYZllXGk
	SbpqMzEsdZiqNbJj9AdQvOD2KpTnXpv9gn1Gu/Q+sGdOMhseSY04y3uZr4G/lMqXTfKGz6ddgBx
	kjCHVHa8hHNrABJ/r6qxzwc9/Ymt1zViMzRc3/HY/94868xfrkUFNdbndLQ27LEm9IoosnCb5gF
	c/9Q=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121900885a.4.1750854061747;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCditgNqKLkT3Kcb/76zkTHjqL5rN/Om6Fnze1yjtsZfzkyU25uWLCyTODkKMaOCcRJaX8Dw==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121898885a.4.1750854061275;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm37502066b.135.2025.06.25.05.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:21:00 -0700 (PDT)
Message-ID: <4f8fa0c7-a208-4ba2-994f-ec7a5da0d39c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:20:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685be9ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: qL4cK7zROzyI_wDDFUErteNrmIkVGb3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MiBTYWx0ZWRfX8nBRFGtfBIOW
 7MhMQBX2nZtC3uvx3UsWUAURmKA1GeObPVMS6YgUjO46BJPZYVaEaAoLqkYVNSfPN7qhfaR/095
 ogNa2TWNKrAMJDdunEsSQGP5BaY/LzN2EPhjKfhwiJCdtGMsEW0j6wr9EbJEdigVPZo1jIIUmdE
 /NKGMk16LdJCArhkhCA5bxX/df4ueFQk5J/jGshTZG4aCkof/jwYVFgBpZviw1siIJLU0ZK6RGx
 AEHUOovvyOdqgHZpbgKE65YCoCngJzdMxCT7H9/jiE9/MsT/dhc+lwDLYWI2qzPzczHLpMKSiA2
 LQnfelwX5DqnHu+O4hDA+4Pd+mDJh0f/KNK7MDRJKVmgZ/GOP7FGVK2m9DIIg3/4pEU5+ZX1w1K
 N9zowxb4dqixpcu9xqMuGZPg5dN4wksXrYT1a3WWQ3K7t95/wQxp1dWDc952mvywzGF1RiiU
X-Proofpoint-ORIG-GUID: qL4cK7zROzyI_wDDFUErteNrmIkVGb3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=810
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250092

On 6/25/25 11:11 AM, Luca Weiss wrote:
> Add the PM7550 and PMIV0108 to the pmic_models array.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
