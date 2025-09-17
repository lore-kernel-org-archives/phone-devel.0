Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461C32341C
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116340; cv=none; b=Dz9pOS012hZsRRl53EePK6VR1Vc1ZCNeDyGZKjEEVGjW6EofrSZg2Gqtr8nKruYHOSHOei2Zzy5kPXFcEKiEbEm/am1EzmwpqmzhsVO7TBqpmkb7wnjAUfVuvQ+QoVnwyRu5H4FjBCISHjs8l33WgffCgGFRW6JdcuSOAeISguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116340; c=relaxed/simple;
	bh=wmnaUoeLg54xR4kD8RVtS7d/+a4+fnfXhWXtZ54xcWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8SfURZD8Gj1omI92b3VbS81NN7F40skwc+BCuX++7aTY/Yu0hFWhe72G9XHpGSfVebDDUndhM+oM3jBqEc1MzWZYvkE5ns2IFf4xMqPQ46dpx0UrWIusD/VFOtXgwpwjyIvGt1URZh2azbf0oHjrRRo/6lic0zDRRa2cjZDs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1F1gnen; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1F1gnen"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZ0h027214
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FR8amwe27Ylu/pUP+vY72tN0Ut6/tbsNkz8y6d1L3c=; b=T1F1gnen/pG2HG6Z
	EKF3zowmzP0ugVBn1c2uzcxqi8lff66lKgjVIFJK62pTeSOPXR90ohiYIl6/Hnxj
	yQHrtzv24MnltrHmmpmYy/pSB8+DHtYbrVKAVMVlT9zt092i5DERdRZmsqSsoqVZ
	XhgsB/ro8WrCGujQ9XtCl4pkzky+GWJ5MBclBZpxGRo8QBEH3mN4I4ovwfR/vKk6
	jWYdXgt42FziZhR+GsBq+mNaaaLa78R/MlIa0ZIt671PwvBdHccuWCn5+nD2cxj1
	Ohjegv5Cro7+P7obqgaa2vuCHfwaJPZwrUZXUibOcz3aIbBXYx7PsGaITJ4ooCyF
	T2qpbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjj01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:38:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-80e91c02c8cso163634185a.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116336; x=1758721136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FR8amwe27Ylu/pUP+vY72tN0Ut6/tbsNkz8y6d1L3c=;
        b=rRT929a2a/Qo6Jcf/ABFr43DDKH7lrIfiPt5p45ThnTv36OfX0/axbUddhZrajQ9lw
         VAZdVjcsiUMlAFvsGddc642cOAlHqeQpqSFwjyy39ANRphcvRMZKsb1mlROSZLngkIgp
         VuiqNb0Vi95oriYEc2UtRiszQCchQbqGsGwgdwAWUCWfZkuZf4EQFf6fc6ieBKsTDgLl
         1OaSwhHnCxx/OA/34KOWFnE/qTXNZGtU9b+GSwL7zwVM7uV8kk9i70if8yoGksVkNEd6
         c3yy6OzwI0HA3aFDMEFHDxNcY95i8NHNndsl+n4ZiD+RUyCZBRumgMMjA3OKDn+TunLQ
         zl6A==
X-Forwarded-Encrypted: i=1; AJvYcCXeaFWQ33lDxoSX+l4LTeIlLTAMjg8vxU+cTpwr+QdgK1gaCa0htZhN3dV09b64XpKuuFLmJg26cDM3Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoAvSM0xJTNt9lQXm7AKvAyKi1g2fwuPAw3xlsE4jYnIJgoFS
	AUInHxWCnc1424sQ68sxsW5vkFZwD2Esmo3xkqokhxuLwoqUQvue6PgCestkeTMc7d/eV2nb40B
	fq4Vt65a/88vL8EUUauqS6v7Ya6nM/YZSutop6AtmRB7cwOSYbsZr0JeaxYJ2CSwhjQ==
X-Gm-Gg: ASbGnctSPaxENL2MemLYJjkV/1aSkUSHHZRYhmIAozURfy5L7vO4taoDGlCaC5MRh10
	5hHKipMw45FPirZnzvQ66fWQWQT1EYWIZ/gasulw2ep9qdkf4sTO8VTHXRMYrBgffWyl2aeHIF6
	yCLV55W71XlgMB9aUlVnWeCKMgOLrT7q2PtyUTxqMgWVuhEM40eyEttT4Q5SeCcTt60SlvXGUQo
	tXbVN+P4pyOdB/zE/i4BKrz4wE9Oo3TKEdNGHhZu+b8J2OwyHXHRK0Hmtf2OQE4/4EPoGClIvT9
	rXeNoLWGlaUsIB3o22ufU7hxyU8F7Ev+v3N0/IsRMQZ7Y1wluuVgvuSlNMN8N/cftBDNNaUyfCT
	VJ6tAZiChFM+oKIPaOI50Aw==
X-Received: by 2002:a05:622a:34e:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ba6a201826mr17337421cf.9.1758116336286;
        Wed, 17 Sep 2025 06:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmQ7zvxYEQCcz1LV/ubwUUWJATtIDKSxIlQFAS7llfXEprD3GrYMvTESV9fbgINseDhj8YWw==
X-Received: by 2002:a05:622a:34e:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4ba6a201826mr17337101cf.9.1758116335644;
        Wed, 17 Sep 2025 06:38:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128506sm1379313066b.28.2025.09.17.06.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:38:54 -0700 (PDT)
Message-ID: <324327b3-7773-4abe-9628-c191685ea646@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:38:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwcJ7vgqWC25a
 UEbHTnAMdMPWDv8lqnOe3cyldy6Tp+MmOoXLkj5tjqOmVOtoOEaWEWTXSR5jJ322sA0foWXDUaK
 XjEYNXnJ7o9ucsZXE4aWlJMC2qMGdMw6JNroKsS0B4OnOKWMdbqVqIX1dj76+ujshdfF+XsablD
 WlhxffplpQf9tU+fF4dOX3STH2yv7Kx6r851+54yE8EKnumPSDiGyGWoQRgO2uIOTHq19vSzPZ8
 xqF/jh5w4SHYjA1gxRBOOhM3eAtj1PMKd4jAmt+oMpDdcmwLVaBCvnHv3VSFxswfsdm63MHbS5Y
 AjtQrrjXB2DcT6o9UcDIWT42vhWMx2zrqL6nUxp42OoIp9Ku11vuZUoPgIBoTgocsd+Y/YZxhql
 XTpOqBm7
X-Proofpoint-GUID: SnHCWq-m8u87xXT2Oisv9RIVqlNhdg3D
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cab9f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=JkoFm2tBDPzt1COVDkcA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=IQdlk4_VRkkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: SnHCWq-m8u87xXT2Oisv9RIVqlNhdg3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> in accordance with:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
