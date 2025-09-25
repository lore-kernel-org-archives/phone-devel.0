Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBA2DE1F0
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792119; cv=none; b=Mn7nm1bgUF86Yqc11xNYjp05OjdIjmBdnLu60Xas0+ZW+e5MfyDbEoudfKaEk/v2YYZxV9VRxZOqx+Q8Hl5q4Fbm2G1BiZtc1mULxAvoN9FDLuhJ1I3UA0zU6FWeBmzPJ4zK3fIH8V3sWELt0IbyAzppMieD1/zZ9bafCAjIG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792119; c=relaxed/simple;
	bh=YuN2jxSdm0ZZkGMeRrFad1MgrLUBYsgNVOQsFLIGfZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mh8HITT8BEKebXKeCReQbhmkob99p6oCdaewZaMBPHnoa/p8+9K+KcoK7uCCzTsa7eydKiPEjft3Nj5+mVuwN+Rmdtf0CJmDP+NZmzuzXvFVrOksUSi8qE+/kqmDZ6MBaIVFKrzcXXVXyVn8xSKai8yFY/3gAhaiajeZ3D1h1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpxISx3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpxISx3D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P8Fdmx018220
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=; b=MpxISx3D5ylLI7z7
	xry39xZ8wQkjCX0D5Tav+KZW74WENGTIphUInpXBVPNrEK0J5iIKevLedCaQqrxb
	Mr/Y/F8WbfyqTQ0T/lyCFh+VxB75TTdEmUzXZno0OqkHBlruo1yyrwDi5xv4xQsq
	puJV1fggyRt+nU4IauL1ESO4wcE9Y8d2/SMNUsE1WlysrIVB2WXoUwRfIBlzUg+J
	MjYSlAlcRch9h3eyALoo/aEFlGSjH6N6fZKOyhay4fadPgF3qvc5m5hdDRWTL0uF
	yIiOujlPGMoh+GuZdbulCMsQEuK2b4hEYRx4CT6LGtf1zIDvcpkuG1ZFVut0GwVr
	8k+sZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbgn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:21:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f5a43b6so1632236d6.2
        for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792116; x=1759396916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=;
        b=ZzxJeMbm+LcA92TMqXmU1vN/wZLqILPPcPKvsGgrS4WdMHO/lN2M3GQ/tcXgEJZh0S
         ISYDxLJEvK2Fd4BQ5qRZPRnKo+4r0kLXLV9pgGLKmwVPmSLec4XQamQBiQWGKLIwno9c
         ck8nNgmfXwrU9Nu65P5Y3Fm5jY6HFmRMrcRtquTTC8bOkhdjaLyOMw1/zYOpDyaPbno+
         5+aFvIvfC+JHMbtDZ7uza/Kvn8FBvB4RzlOlxJWyt1zlXEx1WOtb2iW3w9EaFyrCROht
         7gY3VSQ/aq+UfzRGu8J6w9rQ07V8pkAsyaX0vcAd1h6Iv+mQsjh5B5tnrirUXOTHbIdH
         sE3w==
X-Forwarded-Encrypted: i=1; AJvYcCV3/A/j0zJq05BachAh4KmLwReShGEpvNk4DHBZ7NAZ1a800dXL2TMuJHESrjw4ztwR0dqP8iIPbZwZZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZdmlgGMlq4mudoGmzgz3WBJEmEwquhwYLfs3FyiMco58jS6f
	1d22y/ugLlOB46vh5QuH7h8kJ4Bqqhe8SKhiJ9FI9TmOctYdQ0zQObrdPIm8g1t7DBCrSmEd8s4
	+popY1uBjcvoObmo45vEyNDB1FTVkse8SikshcBaSbCTC5ccUCDIRlq2BkIPIF6jKwg==
X-Gm-Gg: ASbGncuqKcJ0UmtLs76xVZatT4RYEaQCSQ6eDsgCKzYs6KX2wgd0TixUP9pfTFfOzhr
	3Ia03y0nyR8RXeaARwqxdcFDPVGoDIX5QJRJww1s2F/oeBgAfmnFHMmWb6narubZw0O7kjqviKj
	/zTQ83bYuV76lZtOkW9c6ILq+qFKMbaxUIMfT75+yBSxKb8M+Mfqrei0wr+seaPnHsD/bDM1qov
	29sGKnoQ7NlDI85nZ7lPG2JZit0AVd83K+0CPYnIa7yu4O1GQPeggSABR4QSgdFv1WIhFEfNl3L
	58nsOySq/wbtAacGJOynmNN6eNWSgDNJu3OOTtxsjCjwtXd/+xiC37RHn3av+ZFMr2ic02r6KQY
	xmLM2wokbY6mjQIGLjNJ6Rg==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id 6a1803df08f44-7fc3ed8a772mr26720156d6.5.1758792115623;
        Thu, 25 Sep 2025 02:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwGMmaaEcZzBvc/SySDy9DSNDQiiY1yU0ffafhsYtzP+HwoCnQGiPWpwjVLzKv+RZ8tvroZQ==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id 6a1803df08f44-7fc3ed8a772mr26719976d6.5.1758792114882;
        Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2ff1sm901820a12.26.2025.09.25.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Message-ID: <3d808b73-7c6a-4b24-a3a7-b7fb798e24cf@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:21:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y8RBge8RREJzdNizmfdMpygkn53QwzqS
X-Proofpoint-ORIG-GUID: y8RBge8RREJzdNizmfdMpygkn53QwzqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9/JZYavbN+QV
 POlIddIgVflDG6iqvtqSX+J5Un4F5GMuFMfRBpj1OGDtGGda2/HsjIqTh2oQ5hfF1r6+urCMGpx
 3+1U4I4Y5wKdElJizMZdxJIsavSIHTGcl32F6TTNrVUD3jaq/JO+vZn8xXm9VEuzDGyjf+T5BNa
 b1MCygyo1IhUmhE12m5lZtIPsMF6QBeL+t5c3y+q3z+pRTDrdlTIBJK2HLOWFIbQUN6TME4tXYd
 VhoamSLThMpN89l7BRG4EDeZKrc8JS8aCkqMu7gngb4iUV7GWhp0wF6u5B3udoDuiaJofYfcaA5
 7z2pigIFE+3Nxpbi7e6DXb8cyiqChIb8eBUX11Sro56VdGKQ+xcvb06AcePdAuYqWgsm4G0MlwF
 0yb4i8q+
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d509b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OZMW2xe04SQmtW8ssQgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Document panel Tearing Effect (TE) GPIO line.

"document" is a keyword in DT context, perhaps "describe" is what
you're looking for

with that changed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
