Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0282D94A8
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764589358; cv=none; b=j+J98mw8AJOss5PX5UKVipgF4gnkEVxw+nisBwcByADIYgsIGQsNLaEzWD2gR4IXO8MTeWc3SISmPDruTRrE2mpU89JA8o9ktLLHORjjL8z7kEtnlj+qjdz3AP8v2hTyANACV0qxEyyZLqRuY1oWViM8N61DcBzcklLinDeQU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764589358; c=relaxed/simple;
	bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoZjWe+O+xPULGo+R0nZcLTSy+yIc7+06Tdt3mN0lzi85r9dGbYm87cyaP8S14USBZPeOCYgs7d6pkEeuIZ5l20NanUyDkuYLl2xkCkRE5/UvEPyKRvQO82Rug31kVvSUXDGeRs0g0g8LuT2c/3K4QSBNx6C9z0J5ajrW8b6n+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA7iqb6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8x3vZEu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA7iqb6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8x3vZEu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18vfSI2800646
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=; b=YA7iqb6o7+oDOQWN
	AtUYdzSuR/+OyshkssRGHYZtEyHNMSUEtkGnV7SlDmdrP/tWnnNZzDo6m3lmQ+NL
	oyY03E6eMurLhCsHuTRu8toISkGQjPChWy5ZpA50WKeDfLo+/RSJsl9X3QjCzanM
	xbSbAC8P4s2rR7SjyG5B3t2ozlHvWDnUTmteLV+3qMEqJBoUEerMrpM2lFJaSJMm
	d23bPMHvwL8vfXn7aKF4oEgu2a00rj+ZNTbXOwGj4AJaEJ4MVp0mz1pDbQ2QAQef
	GIfe65yRCF8NmOvW5EK9B6JuI2UuEIrokel7VwW9XyNi7L31awZIzWFe/Yaggr7/
	XIsM5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvsuax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 11:42:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so14912801cf.1
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764589355; x=1765194155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
        b=F8x3vZEuRHgARMpD/2exSt3jG4+4NVth5fAvwKFp22UxIazCnYmhn0T/82FHx65g4D
         txNsD1UWoIV7WVDxboK3j6PECHdB5oO/qB9xHi1F7+FJV1lCASZC97WPU+m5cbbOIxz8
         uBUNb3pP0Q8brMlE7Ki3REGek09jw41v4iW1sqpD0Fycp9vnoRWDKQeo36ts3c6OUUeC
         ElGYDWd3v1Y8atTO5/RljP+unySViDphUGEqhkT+Vx0l8mDfiQHCOfIhQ9N8Wk7xbzij
         YZX8PUliCunG6TndCDXCAMygezQk/IrYSAd4tBWisG5sFbXp2mQddCfU3WR/Co1D7Whh
         5w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764589355; x=1765194155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGZqwPPf0pQCF3sBnET4Si/EPdcbyy3iS+zz5CzoJAo=;
        b=FuAj2AbZMmNcyQBxedDn0alxgBAMuU6n7UcMbi97OFh/P56kLjB0avJqnNUFT7oTrm
         xvQcGM0cwwamKbXpoYg+oLW5UOoNrAdJFwwTwnhdZYKCKF7kG/DBN8Lv2JiqUfG2pSZJ
         xG75pstMCCpTZEOV3CzK2oYLOIZMOey9tEGEhM25fwRMDTVsyI4s6wo7QmCEf0fXVXz3
         fyFsYQVF3FUxlCqQZ9moZA/64lTRA2z5GhWwMDVE26ep9m6I/Lo/31y6KSnYvdWbyYVO
         pIgWch3G2kuiA5A+DZZv3kV0Z/LWaD0dYwboBAFD3Gsd3D1hH0doRBGLXfXjhnUUi3/0
         coiA==
X-Forwarded-Encrypted: i=1; AJvYcCWL8t+8PIP7b5/a4alqlpaB1sAEXftxFTAi7fEAWm0BLO9zPc1vtQE6zNZZoZK/7djxP62LMH7D8DyZxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylVLTBLPbOzCUckOxQOIlFsDWr1Jpao7dpw4JfATgJ9RTcaYT2
	T1lFNRjsH1FjMwNL7FAKWPteAyxf09WfETDCpG7yhNd7ok/uwkkA+pRft6lBb53Za86AsL34Io1
	qR+rDN4HssnbAUQhD/sT90aicdsx0rbFSy2g6bHXB35sHfZDSK/E4ppIB7h6b05Dh6Q==
X-Gm-Gg: ASbGncuh8P7p+lcIUT2C9Tlox4hFxxCbyvSMkVAY5zpB94rtkMGuCOerW+yrfdOGFt4
	3lZ5xdAlhFi597vn4al0nieHrsJRZDrhsU+WxDgIWR9KlBxTOfHtVNI3zXu+AGqGCoPWVwY8t7R
	R+/bRYAPVyhSw6+91vcn87OHqzTisQEViGQfclvrNEPmD07sV8VaaDhJTis3E0HdPV+OptVVQ0M
	8QjHF5gtJVIuNsrT5PWGfm0x8JERmbcm8ZUCQgWQ/gkm4AB1wZf30TauFCxRe8Q0GoQ0v4DumI3
	Qg25+TQFRQuCNYJXIfT4kD3V7aMCh1qhle2cBXUxm0ETvncpwm5Cs7O8P22iNR0HPPnNNWvPhTW
	HWFGWsYTLE/hwGUGt4c/cO3P/Kok2q1mLaB0cgmhfSx10RBipnHYqAbSSFbdt+j84kWQ=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr401442831cf.7.1764589355497;
        Mon, 01 Dec 2025 03:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtKPMWapl5XLHH3Ls6A2W4eskhuJBji8AbzTzz7F2JxfHCs5s7yYpv4jTjsYG3lHoa/ByqDg==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr401442621cf.7.1764589355094;
        Mon, 01 Dec 2025 03:42:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d828sm1198664666b.18.2025.12.01.03.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:42:34 -0800 (PST)
Message-ID: <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:42:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
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
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zvcbrUv3fAww-3I6NSB-a5_byG_X0zLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5NSBTYWx0ZWRfX5g5vH67RslvV
 XAB1cpia108efPe5zFn6k4yXEq14r2jHMwOmQ1cBEk84gYPvCcPy8kn3+wMfBqFsepBb2H23+dV
 6TxNvhg4l4eA9W39Ym9E3ATI+XfZysNOED/JiwSTsdrtme6PjOyeJmT0m51fQZ78xr0cuT9o8f/
 P5NOhci1s5x/Ew2iL3xWiMzMZ+CM7Bo51qrDl4jlypTcBVclNUYvG4AbV1fdippxt7DDoP4/9wh
 UBE759os8CzbRswOByrrND0PtODRyYnqSGUPoNmWNF3cgaBt1A4q/eZpglqaxxE4uD2rtuNeycz
 fsBaMaYVtWRWM7G6ZshQ0lfgzb2zxWrC/LImz2XatcHl4Si+AbVD2pAGEi2uS7tjuJGhZIX3N5w
 xaV9Hgu0VF0LqjY0pZsio0Wbjo8Wog==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d7f2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VVznJNgsxCGEoLoMiiIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zvcbrUv3fAww-3I6NSB-a5_byG_X0zLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010095

On 11/28/25 9:20 PM, Paul Sajna wrote:
> I did more testing on this, and the led only comes on if it's brightness is set to approx 150/255 or lower. In that case, should I set led-max-microamp to 60mA?

FWIW your downstream kernel sets up channels 0 and 1, here you only
enabled 1. Taking a look at a picture of the phone, I only see a single
LED on the back, so perhaps you're (over)driving a single power line?

I'm not a milion percent sure, but I would assume the current draw
*limiting* register applies to the sum of the current going through
the three channels because there's only a single instance of it.

Konrad
