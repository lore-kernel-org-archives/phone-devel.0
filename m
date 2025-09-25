Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAB286D5D
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793033; cv=none; b=ON64OBTFVOGph4siuIM5NTggtvcVVLoENMUubEcrAgyy2jxxyyH7ANuKTbsT/RtOQ9y1AP8LudOAeGxyXX24e1bHkp9VhwsQhp+uNXF9LdHPKmDYctfXT8/WoL+46hQPJIzYUnQWeIwlFXcaW01tBTJJqfANtHi7isHzRme6cog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793033; c=relaxed/simple;
	bh=zamVv0dXOTdYNEn2puE91zH5uRrPdj3WMXEeHYVBzVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijCJwjkH/pj/YyotveSJCSn7eKwKKYvifyWIsMviMEA7gFyPnJa4s6gr0fu2y6L8pcBQaNgiMjyIYlqLGUp/2/SP5mdqZhzzwxqtHKGMBhIR6itVp1bf0gIDhfcmccxLU13toNMs5odhqtIB/6Z4FzAZcVzsFEEMmeENgLStFVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USvucVEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USvucVEw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9W4Rp017434
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeVa0WZkgGit33CQLVzL5GAxI4BelhXE8gH2cuvDak4=; b=USvucVEwWX5vGxBE
	LVg5Xvi7Fx4WN8BKLqsVOWdNAE/TH+j+AAY6a0N3hJ6B48VvYBi5YQxG+slFxWCk
	+q6x5cQ/BVELtr46VFsWKY0szkEVY42G4QaLF5avDysrH+8ukM3os+BqKS9OMEY+
	qy91E90w4tAHlW7nbSAOZsOOt7/2VHcVMes+nhVa6YUAToMTnZfgi435xk2lrKWc
	ANrhFdO2vg4T2QdlnXrKhIm/JtbkKYYjauYCX5wV8ow2JRQidVJXrvrWfEaYPuGK
	Kxfg8zg9Lip8NfNdR23vAmM1f1ECL+iRg9kL8qAPZzYWLSHEY5aKf8KeQfklB/PA
	BgKUqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0x92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:37:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8707701f2so26882385a.3
        for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 02:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793030; x=1759397830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeVa0WZkgGit33CQLVzL5GAxI4BelhXE8gH2cuvDak4=;
        b=Ow6wvFnsn5XL5AKcage2r8wJ2orM7faReXLkjBUFdjLoBYxVmW4pryJJllwQBlaiwQ
         4hZcoL81Ljf27iWme+eS+SrS+rB/FtAHnBsZtho8j91EUwOxoWNPAENWk3ZHru45LJgC
         7TtS6QwsXoBaaKfVVzZNWvitnRKsAfJzWHpvtoz4pR24BckV550Sehe324UMemUgz9q2
         lRXYAjgbkIjwgSvOJyXjw0+rpLp8y+2PiAIJB6vlOH8ynq/O4zJAoncgjLqtNMLS+/ui
         p5b7LrwaaNJ2mWp/x1hw2pkC+yUvKxjJSEJMLOeYzVO5ICAKVoUYxkezuLFm438RbSFk
         w1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXsP4X1R/I4a6fkSJpxPgEQ0ZXUq8E6wCw41BXONs6fJC9j3ujnNPm0g0TFmo4PblKk83zO65XPWfGCiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEw2Uls6ZnGExj18GWhjDocIGnfw9N2LptOnrP/xTx/osbfZyu
	XTFpYjhfRFqYfshWvdRI3BM5xGSxMtJ5J9CA4+4SBY1bNpcKiPUbRGTPQRAsTlmTqKRApXuLhY5
	9jqtsEpZanendp76CtZoQg8uBS4gZUJ8gbQxzL3uNIjcDAQcV+v52bE3pu4U8Brp4lQ==
X-Gm-Gg: ASbGncvdKaFt6g1RqffKLg16lsgTkOmL7jOrC/sBmOdcAO06wIy6CBNPMXCby+UME9h
	CvTY0YuXCevPeIkYzYqz6FrSFnL3k3ssBxYvEE3D/ydDTIYkitRte5rtfDF0Uwn+Qjimr4/J+W5
	oP5z2VDwUIteLHlAriqvFRO7exmfLZZgmC9EMyibj0jj03KvSux7JN708hkmtqr6bCLYcC1hEQa
	8iEEyuKWN8yhKpy/3/8PyG36cAm2YWak5w4scJQZaN+3HrZ+OvOmbAybxZvuFoNgvSamilrjZmA
	IQVoycp95iAolN3B8K6goNyLncp89A2VL1TcyCJCoENH6jDmqB5BkNIh1wbdoZLKcpR0dBrON9m
	xc5yuanyyTq4y6AxbgLdIfw==
X-Received: by 2002:a05:622a:7616:b0:4dc:15a4:60ae with SMTP id d75a77b69052e-4dc15a462d0mr1290731cf.4.1758793029497;
        Thu, 25 Sep 2025 02:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhWYbhiie+DtdNK2tQZ+Tuc65d9LphLjEc6TZpsNJ8FCEHPxhcyKa4Sn3ApENdJ4f9vHV2Lw==
X-Received: by 2002:a05:622a:7616:b0:4dc:15a4:60ae with SMTP id d75a77b69052e-4dc15a462d0mr1290631cf.4.1758793028998;
        Thu, 25 Sep 2025 02:37:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35458950edsm128031966b.90.2025.09.25.02.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:37:08 -0700 (PDT)
Message-ID: <a078c6a0-5a54-4ad5-8e3a-c676783e68a3@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:37:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC with
 AMS641RW panel)
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p11Kiys7pkHN-tNHWeTE8T5vRQyR6LJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX2glmi0QhLHmD
 5VGiIZVaVxNXNq+UhvY6SQY/zDhuMZxVMaToo2pukTIwwoJuOirK70sDUll46o8bTQX4jG9jVen
 MWj66ez55VVCzVYpvMM+rDA5tPvcCan9pTjchUz6AX+P1tjNC/B2SFZsJREilGz/xLUObQCMCal
 zvIItJ4HRu4wdTZAbVeaL0mGSEcI/7IkkuLSAF/Yi+W6XpAq4s+SZYvk3owCvEAJzXCwst02cg4
 eO54ts+w6ICina1TLdJAzsyYHHWgjpzNZc2ZA+YwtxQf0/AeNDBpEIb7ImuuqUei0+o1N05uGYh
 Vr639oHAnz2/jx5vSZhHqYxuN+zAWCQK2992//4EZwyZb4fvSouYN9s1ggYVETYtQrQY9wsMcck
 VV828yCz
X-Proofpoint-GUID: p11Kiys7pkHN-tNHWeTE8T5vRQyR6LJj
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d50d47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=CYF1pGrXqkiHziMhkFIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> This patchset enables display on the OnePlus 6T smartphone.
> 
> Minor adjust to the device-tree of OnePlus 6 had to be done
> to properly document reset GPIO used. Also same adjustments
> had been done to the sofef00 panel driver (used by OnePlus 6).
> 
> In the last step new DDIC driver is introduced together with AMS641RW
> panel sequences.

I think you skipped the elephant in the room - some of these patches
break panel for the phone intermittently..

Konrad
